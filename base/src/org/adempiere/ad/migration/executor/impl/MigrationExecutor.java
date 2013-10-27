/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) <Company or Author Name> All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or              *
 * modify it under the terms of the GNU General Public License                *
 * as published by the Free Software Foundation; either version 2             *
 * of the License, or (at your option) any later version.                     *
 * This program is distributed in the hope that it will be useful,            *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of             *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                       *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 *                                                                            *
 * @author Teo Sarca , t.sarca@metas.ro , METAS GROUP						  *
 *  			                                                       		  *
 *****************************************************************************/
package org.adempiere.ad.migration.executor.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;

import org.adempiere.ad.migration.executor.IMigrationExecutor;
import org.adempiere.ad.migration.executor.IMigrationExecutorContext;
import org.adempiere.ad.migration.executor.IPostponedExecutable;
import org.adempiere.ad.migration.executor.MigrationExecutorException;
import org.adempiere.ad.migration.model.I_AD_Migration;
import org.adempiere.ad.migration.model.I_AD_MigrationStep;
import org.adempiere.ad.migration.model.X_AD_Migration;
import org.adempiere.ad.migration.service.IMigrationBL;
import org.adempiere.ad.migration.service.IMigrationDAO;
import org.adempiere.ad.migration.util.MigrationStepSeqNoComparator;
import org.adempiere.exceptions.AdempiereException;
import org.adempiere.model.InterfaceWrapperHelper;
import org.adempiere.util.Check;
import org.adempiere.util.Services;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Trx;
import org.compiere.util.Util;

class MigrationExecutor implements IMigrationExecutor
{
	private final transient CLogger logger = CLogger.getCLogger(getClass());

	private static final String LOCALTRXNAME_PREFIX = "MigrationExecutor";

	private final IMigrationExecutorContext migrationCtx;
	private final I_AD_Migration migration;
	private List<I_AD_MigrationStep> migrationSteps;

	private CommitLevel commitLevel = CommitLevel.Batch;

	private Action action;
	private List<Exception> executionErrors;

	public MigrationExecutor(final IMigrationExecutorContext ctx, int migrationId)
	{
		super();

		if (ctx == null)
		{
			throw new IllegalArgumentException("ctx is null");
		}
		if (migrationId <= 0)
		{
			throw new IllegalArgumentException("migrationId <= 0");
		}

		this.migrationCtx = ctx;

		//
		// Load AD_Migration
		this.migration = InterfaceWrapperHelper.create(ctx.getCtx(), migrationId, I_AD_Migration.class, Trx.TRXNAME_None); // out of trx
		if (migration == null)
		{
			throw new IllegalArgumentException("No migration found for AD_Migration_ID=" + migrationId);
		}
	}

	@Override
	public I_AD_Migration getAD_Migration()
	{
		return migration;
	}

	@Override
	public CommitLevel getCommitLevel()
	{
		return commitLevel;
	}

	@Override
	public void setCommitLevel(CommitLevel commitLevel)
	{
		this.commitLevel = commitLevel;
	}

	@Override
	public List<I_AD_MigrationStep> getMigrationSteps()
	{
		if (migrationSteps == null)
		{
			migrationSteps = Services.get(IMigrationDAO.class).retrieveSteps(migration, true);
		}
		return migrationSteps;
	}

	@Override
	public void setMigrationSteps(List<I_AD_MigrationStep> steps)
	{
		if (steps == null)
		{
			migrationSteps = Collections.emptyList();
		}
		else
		{
			migrationSteps = new ArrayList<I_AD_MigrationStep>(steps);
		}
	}

	@Override
	public void execute()
	{
		final I_AD_Migration migration = getAD_Migration();

		final Action action;
		final String actionStr = migration.getApply();
		if (actionStr == null || X_AD_Migration.APPLY_Apply.equals(actionStr))
		{
			action = Action.Apply;
		}
		else if ("N".equals(actionStr))
		{
			// NOTE: there are some cases when this column is set to No.
			action = Action.Apply;
		}
		else if (X_AD_Migration.APPLY_Rollback.equals(actionStr))
		{
			action = Action.Rollback;
		}
		else
		{
			throw new IllegalStateException("Unknown action " + actionStr + " for " + Services.get(IMigrationBL.class).getSummary(migration));
		}

		execute(action);

		executePostponedRequests();
	}

	@Override
	public void execute(final Action action)
	{
		DB.saveConstraints();
		try
		{
			DB.getConstraints().addAllowedTrxNamePrefix(LOCALTRXNAME_PREFIX);

			execute0(action);
		}
		finally
		{
			DB.restoreConstraints();
		}
	}

	private void execute0(final Action action)
	{
		if (action == null)
		{
			throw new IllegalArgumentException("action is null");
		}

		this.action = action;
		this.executionErrors = new ArrayList<Exception>();
		final List<I_AD_MigrationStep> steps = getMigrationSteps();

		log("Executing " + action + " on " + steps.size() + " steps", null, false);

		//
		// Make sure steps are in proper order
		Comparator<I_AD_MigrationStep> stepsCmp = MigrationStepSeqNoComparator.instance;
		if (action == Action.Rollback)
		{
			stepsCmp = Collections.reverseOrder(stepsCmp);
		}
		Collections.sort(steps, stepsCmp);

		final String trxName;
		final Trx localTrx;
		if (commitLevel == CommitLevel.Batch)
		{
			trxName = Trx.createTrxName("MigrationExecutor");
			localTrx = Trx.get(trxName, true);

			if (migration.isDeferredConstraints())
			{
				disableConstraints(trxName);
			}
			else
			{
				enableConstraints(trxName);
			}
		}
		else if (commitLevel == CommitLevel.Step)
		{
			// we will execute each step in a generated transaction
			trxName = null;
			localTrx = null;
		}
		else
		{
			throw new AdempiereException("Not supported commit level: " + commitLevel);
		}

		try
		{
			this.executionErrors = new ArrayList<Exception>();
			for (final I_AD_MigrationStep step : steps)
			{
				if (!step.isActive())
				{
					log("Skipped inactive step " + step.getSeqNo(), "SKIP", false);
					continue;
				}

				//
				// Make sure our step is in the right transaction
				if (!Util.equals(trxName, InterfaceWrapperHelper.getTrxName(step)))
				{
					InterfaceWrapperHelper.refresh(step, trxName);
				}

				try
				{
					final MigrationStepExecutorRunnable executorRunnable = new MigrationStepExecutorRunnable(migrationCtx, step, action);
					Trx.run(trxName, executorRunnable);
				}
				catch (Exception e)
				{
					executionErrors.add(e);

					// Abort on first error
					final boolean fatal = MigrationExecutorException.isFatal(e);
					if (fatal && migrationCtx.isFailOnFirstError())
					{
						throw e instanceof MigrationExecutorException ? (MigrationExecutorException)e : new MigrationExecutorException(e);
					}
				}
			}
		}
		finally
		{
			// If is a locally managed trx
			if (localTrx != null)
			{
				if (executionErrors != null && !executionErrors.isEmpty())
				{
					localTrx.rollback();
				}
				else
				{
					localTrx.commit();
				}
				localTrx.close();
			}

			// Make sure we have updated migration status before throwing further
			updateMigrationStatus();
		}
	}

	private void executePostponedRequests()
	{
		final List<IPostponedExecutable> executables = migrationCtx.popPostponedExecutables();
		for (IPostponedExecutable executable : executables)
		{
			executable.execute();
		}
	}

	private void disableConstraints(final String trxName)
	{
		final String sql = "SET CONSTRAINTS ALL DEFERRED";
		DB.executeUpdateEx(sql, trxName);

		logger.log(Level.INFO, "Constraints deferred");
	}

	private void enableConstraints(final String trxName)
	{
		final String sql = "SET CONSTRAINTS ALL IMMEDIATE";
		DB.executeUpdateEx(sql, trxName);

		logger.log(Level.INFO, "Constraints immediate");
	}

	private void updateMigrationStatus()
	{
		Services.get(IMigrationBL.class).updateStatus(migration);
	}

	@Override
	public String getStatusDescription()
	{
		final String statusCode = migration.getStatusCode();

		if (action == Action.Apply)
		{
			if (X_AD_Migration.STATUSCODE_Applied.equals(statusCode))
			{
				return "Migration successful";
			}
			else if (X_AD_Migration.STATUSCODE_PartiallyApplied.equals(statusCode))
			{
				return "Migration partially applied. Please review migration steps for errors.";
			}
			else if (X_AD_Migration.STATUSCODE_Failed.equals(statusCode))
			{
				return "Migration failed. Please review migration steps for errors.";
			}
		}
		else if (action == Action.Rollback)
		{
			if (X_AD_Migration.STATUSCODE_Unapplied.equals(statusCode))
			{
				return "Rollback successful.";
			}
			else if (X_AD_Migration.STATUSCODE_PartiallyApplied.equals(statusCode))
			{
				return "Migration partially rollback. Please review migration steps for errors.";
			}
			else
			{
				return "Rollback failed. Please review migration steps for errors.";
			}
		}

		//
		// Default
		return "@Action@=" + action + ", @StatusCode@=" + statusCode;
	}

	@Override
	public List<Exception> getExecutionErrors()
	{
		if (executionErrors == null)
		{
			return Collections.emptyList();
		}
		else
		{
			return new ArrayList<Exception>(executionErrors);
		}
	}

	private final void log(String msg, String resolution, boolean isError)
	{
		final Level level = isError ? Level.WARNING : Level.INFO;

		if (!logger.isLoggable(level))
		{
			return;
		}

		final StringBuffer sb = new StringBuffer();
		sb.append(Services.get(IMigrationBL.class).getSummary(migration));

		if (!Check.isEmpty(msg, true))
		{
			sb.append(": ").append(msg.trim());
		}

		if (resolution != null)
		{
			sb.append(" [").append(resolution).append("]");
		}

		logger.log(level, sb.toString());
	}
}
