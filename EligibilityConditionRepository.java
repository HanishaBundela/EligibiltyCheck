package com.empeligibility.org.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.empeligibility.org.controller.DatabaseConnector;
import com.empeligibility.org.model.EligibilityCondition;

public class EligibilityConditionRepository {
	
	public List<EligibilityCondition> getFields(String jobPost) throws SQLException {
		List<EligibilityCondition> eligibilityConditions = new ArrayList<EligibilityCondition>(); 
		PreparedStatement ps = null;
		PreparedStatement p = null;
		Connection con = null;
		
		try {
			con = DatabaseConnector.getInstance().getConnection();
			p = con.prepareStatement("select JobId from jobname where jobname = ?");
			p.setString(1,jobPost);
			ResultSet r = p.executeQuery();
			r.next();
			int sno = r.getInt(1);
			ps = con.prepareStatement("select SrNo,Feild,Operator,Value from jobcriteria where jobId = ?");
			ps.setInt(1, sno);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				EligibilityCondition elibiglityCondition = new EligibilityCondition();
				elibiglityCondition.setSrNo(rs.getInt(1));
				elibiglityCondition.setField(rs.getString(2));
				elibiglityCondition.setOperator(rs.getString(3));
				elibiglityCondition.setValue(rs.getString(4));
				eligibilityConditions.add(elibiglityCondition);
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return eligibilityConditions;
	}
}