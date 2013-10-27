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
 *																		      *
 * @author Teo Sarca, t.sarca@metas.ro, METAS GROUP							  *
 *  			                                                       		  *
 *****************************************************************************/
package org.adempiere.ad.migration.util;

import java.util.Comparator;

import org.adempiere.ad.migration.model.I_AD_MigrationStep;

/**
 * Comparator which compares steps by SeqNo.
 * 
 */
public final class MigrationStepSeqNoComparator implements Comparator<I_AD_MigrationStep>
{
	public static final MigrationStepSeqNoComparator instance = new MigrationStepSeqNoComparator();

	private MigrationStepSeqNoComparator()
	{
		super();
	}

	@Override
	public int compare(final I_AD_MigrationStep step1, final I_AD_MigrationStep step2)
	{
		if (step1 == step2)
		{
			return 0;
		}
		if (step1 == null)
		{
			return -1;
		}
		if (step2 == null)
		{
			return +1;
		}
		return step1.getSeqNo() - step2.getSeqNo();
	}

}
