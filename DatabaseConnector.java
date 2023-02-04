package com.empeligibility.org.controller;
import java.io.BufferedReader;  
import java.io.IOException;  
import java.io.InputStreamReader;  
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  

public class DatabaseConnector {

		   private static DatabaseConnector dbObject;
		   static int count = -1;
		   private DatabaseConnector() {      
		   }

		   public static DatabaseConnector getInstance() {

		      // create object if it's not already created
		      if(dbObject == null) {
		         dbObject = new DatabaseConnector();
		      }

		       // returns the singleton object
		       return dbObject;
		   }

		// to get the connection from methods like insert, view etc.   
	          public Connection getConnection()throws ClassNotFoundException, SQLException  
	          {  
	                
	              Connection con = null;  
	              Class.forName("com.mysql.cj.jdbc.Driver"); 
	              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "hanisha613");  
	              return con;  
	                
	          }  
	 }


