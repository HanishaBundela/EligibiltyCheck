package com.empeligibility.org.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.empeligibility.org.controller.DatabaseConnector;
public class Employee {
	private String name;
	private String email;
	private String phoneNo;
	private int age;
	private String gender;
	private String qualification;
	private String location;
	private String softSkills;
	private String technicalSkills;
	private String jobType;
	private String expSalary;
	private String workPlace;
	private int workExperience;
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getAge() {
		return age;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getGender() {
		return gender;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getQualification() {
		return qualification;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getLocation() {
		return location;
	}
	public void setSoftSkills(String softSkills) {
		this.softSkills = softSkills;
	}
	public String getSoftSkills() {
		return softSkills;
	}public void setTechnicalSkills(String technicalSkills) {
		this.technicalSkills = technicalSkills;
	}
	public String getTechnicalSkills() {
		return technicalSkills;
	}
    public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getJobType() {
		return jobType;
	}
	public void setExSalary(String expSalary) {
		this.expSalary = expSalary;
	}
	public String getExSalary() {
		return expSalary;
	}
	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}
	public String getWorkPlace() {
		return workPlace;
	}
	public void setWorkExperience(int workExperience) {
		this.workExperience = workExperience;
	}
	public int getWorkExperince() {
		return workExperience;
	}
	
	public Object getFieldValue(String fieldName) {
		if(fieldName == "age") {
			return getAge();
		}
		return null;
	}
	
	public String getFieldType(String fieldName) {
		if(fieldName == "age" || fieldName == "workExperience") {
			return "Integer";
		}
		return "String";
	}
}

