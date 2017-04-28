<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Connection con=null;
String url= "jdbc:mysql://localhost:3306/book_ex";
String uid= "user1";
String pwd="user1";
String driver= "com.mysql.jdbc.Driver";

try{
	Class.forName(driver).newInstance();
	con= DriverManager.getConnection(url,uid,pwd);
	
	ResultSet rs=null;
	List emp = new LinkedList();
	JSONObject responObject=new JSONObject();
	String query="select id, name from employee";
	PreparedStatement psmt= con.prepareStatement(query);
	rs=psmt.executeQuery();
	JSONObject empobj=null;
	while(rs.next()){
		String name = rs.getString("name");
		int empid = rs.getInt("id");
		empobj= new JSONObject();
		empobj.put("name", name);
		empobj.put("empid", empid);
		emp.add(empobj);
		
	}
	responObject.put("emp", emp);
	out.print(responObject.toString());
}
catch(Exception e){
	e.printStackTrace();
}
%>


</body>
</html>