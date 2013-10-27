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
 * @author Teo Sarca, t.sarca@metas.ro, METAS GROUP							  *
 *  			                                                       		  *
 *****************************************************************************/
package org.adempiere.ad.migration.logger.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.adempiere.ad.migration.logger.IMigrationLoggerContext;
import org.adempiere.ad.migration.model.I_AD_Migration;
import org.adempiere.ad.migration.service.IMigrationDAO;
import org.adempiere.service.ISysConfigBL;
import org.adempiere.util.Services;
import org.compiere.util.CCache;
import org.compiere.util.Env;
import org.compiere.util.Ini;

public class SessionMigrationLoggerContext implements IMigrationLoggerContext
{
	public static final String SYSCONFIG_Enabled = "org.adempiere.ad.migration.logger.MigrationLogger.Enabled";
	public static final boolean SYSCONFIG_Enabled_Default = false;

	private final Map<String, Integer> migrationsMap = new HashMap<String, Integer>(3);
	private final CCache<Integer, I_AD_Migration> migrationsCache = new CCache<Integer, I_AD_Migration>(I_AD_Migration.Table_Name, 3, 2);

	public SessionMigrationLoggerContext()
	{
	}

	@Override
	public boolean isEnabled()
	{
		if (!Ini.isPropertyBool(Ini.P_LOGMIGRATIONSCRIPT))
		{
			return false;
		}

		if (!Services.get(ISysConfigBL.class).getBooleanValue(SYSCONFIG_Enabled, SYSCONFIG_Enabled_Default))
		{
			return false;
		}

		return true;
	}

	@Override
	public boolean isGenerateComments()
	{
		return true;
	}

	@Override
	public I_AD_Migration getMigration(String key)
	{
		final Properties ctx = Env.getCtx();

		final Integer migrationId = migrationsMap.get(key);
		if (migrationId == null || migrationId <= 0)
		{
			return null;
		}

		I_AD_Migration migration = migrationsCache.get(migrationId);
		if (migration != null)
		{
			return migration;
		}

		// We have the ID in out map, but cache expired, which means that maybe somebody deleted this record
		// Trying to reload
		migration = Services.get(IMigrationDAO.class).retrieveMigrationOrNull(ctx, migrationId);
		if (migration != null)
		{
			putMigration(key, migration);
			return migration;
		}

		return migration;
	}

	@Override
	public void putMigration(String key, I_AD_Migration migration)
	{
		migrationsMap.put(key, migration.getAD_Migration_ID());
		migrationsCache.put(migration.getAD_Migration_ID(), migration);
	}
}
