package com.empeligibility.org.repository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.empeligibility.org.controller.DatabaseConnector;
import com.empeligibility.org.model.Employee;
import com.empeligibility.org.model.Login;

public class LoginRepository {
	public void saveLogin(Login log) throws SQLException  {
	PreparedStatement ps = null;
	Connection con = null;
	try {
        con = DatabaseConnector.getInstance().getConnection();  
        ps = con.prepareStatement("insert into login values(?,?)");
        ps.setString(1,log.getEmail());
        ps.setString(2,log.getPassword());
       
        ps.executeUpdate();
	}catch(Exception e) {
		System.out.println(e + "ERROr");
		if (ps != null){  
            ps.close();  
        }if(con != null){  
            con.close();  
        }   
	}
	}
	public boolean getLogin(String email ,Login log) {
		System.out.println("in Repository");
		PreparedStatement ps = null;
		Connection con = null;
//		 Employee emp = new Employee();
		
		try {
	        con = DatabaseConnector.getInstance().getConnection();  
	        ps = con.prepareStatement("select * from login where email = ?");
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();;
	        rs.next();
	        String dataPassword = rs.getString(2);
	       
	        System.out.println(dataPassword);
	      
			String userPassword = log.getPassword();
			  System.out.println(userPassword);
			if(dataPassword.equals(userPassword)) {
				return true;
			}
			else{
				return false;
			}
		
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return false;
	}
}
	