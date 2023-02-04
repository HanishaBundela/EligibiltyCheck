package com.empeligibility.org.repository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.empeligibility.org.controller.DatabaseConnector;
import com.empeligibility.org.model.Employee;

public class EmployeeRepository {
	public void saveEmployee(Employee emp) throws SQLException  {
	PreparedStatement ps = null;
	Connection con = null;
	
	try {
        con = DatabaseConnector.getInstance().getConnection();  
        ps = con.prepareStatement("insert into details values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1,emp.getName());
        ps.setString(2,emp.getEmail());
        ps.setString(3,emp.getPhoneNo());
        ps.setString(4,emp.getGender());
        ps.setInt(5,emp.getAge());
        ps.setString(6,emp.getJobType());
        ps.setString(7,emp.getQualification());
        ps.setString(8,emp.getWorkPlace());
        ps.setString(9,emp.getLocation());
        ps.setInt(10,emp.getWorkExperince());
        ps.setString(11,emp.getExSalary());
        ps.setString(12,emp.getSoftSkills());
        ps.setString(13,emp.getTechnicalSkills());
        ps.executeUpdate();
	}catch(Exception e) {
		System.out.println(e);
		if (ps != null){  
            ps.close();  
        }if(con != null){  
            con.close();  
        }   
	}
	}
	public Employee getEmployee(String name) {
		System.out.println("in Repository");
			PreparedStatement ps = null;
			Connection con = null;
			 Employee emp = new Employee();
			 int age = 0;
			try {
		        con = DatabaseConnector.getInstance().getConnection();  
		        ps = con.prepareStatement("select * from details where name = ?");
		        ps.setString(1, name);
		        ResultSet rs = ps.executeQuery();;
		        rs.next();
		        age = rs.getInt(5);
		        emp.setName(rs.getString(1));
		        emp.setEmail(rs.getString(2));
		        rs.getString(3);
		        emp.setGender(rs.getString(4));
		        emp.setAge(rs.getInt(5));
		        emp.setJobType(rs.getString(6));
		        emp.setQualification(rs.getString(7));
		        emp.setWorkPlace(rs.getString(8));
		        emp.setLocation(rs.getString(9));
		        emp.setWorkExperience(rs.getInt(10));
		        emp.setExSalary(rs.getString(11));
		        emp.setSoftSkills(rs.getString(12));
		        emp.setTechnicalSkills(rs.getString(13));
		    
			}catch(Exception e) {
				System.out.println(e);
			}
			System.out.println("in Repository");
			return emp;
	}

}



