package com.javaloc.ex;

import java.sql.Timestamp;

public class MemberDTO {

	private String id;
	private String password;
	private String name;
	private String email;
	private Timestamp registeredDate;
	private String address;
	
//	public MemberDto(String id, String password, String name, String email, Timestamp registeredDate, String address) {
//		this.id = id;
//		this.password = password;
//		this.name = name;
//		this.email = email;
//		this.registeredDate = registeredDate;
//		this.address = address;
//	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Timestamp registeredDate) {
		this.registeredDate = registeredDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
