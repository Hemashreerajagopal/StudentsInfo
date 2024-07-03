package com.model;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
public class stuDao {
  public static List<student> getRecords(int i, int t){
	  i=i-1;
	  String sql="select sid,name,city,course,marks from "+"student limit "+i +", "+t;
	  List<student> li=new ArrayList<student>();
	  try {		
	    DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vsbdb", "root", "root");
	    PreparedStatement pst=con.prepareStatement(sql);
	    ResultSet rs=pst.executeQuery();
	    
	   
	    while(rs.next()) {
	    	student s=new student();
	    	s.setSid(rs.getInt(1));
	    	s.setName(rs.getString(2));
	    	s.setCity(rs.getString(3));
	    	s.setCourse(rs.getString(4));
	    	s.setMarks(rs.getFloat(5));
	    	li.add(s);
	    }
  }catch(SQLException e) {
	  e.printStackTrace();
  }
	  return li;
}
}
