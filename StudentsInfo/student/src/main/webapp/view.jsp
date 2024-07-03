<%@page import="com.model.student"%>
<%@page import="java.util.List"%>
<%@page import="com.model.stuDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String pgid=request.getParameter("page");
int pid=Integer.parseInt(pgid);
int id=pid;
int total=5;
if(id==1){}
else{
	id=id-1;
	id=id*total+1;
}
out.println("<h2> Page No: "+ pid +"</h2>");
List<student> list=stuDao.getRecords(id, total);

out.println("<table><tr><th>SID</th><th>Name</th><th>City</th><th>Course</th><th>Marks</th></tr>");
for(student s:list){
	out.println("<tr><td>"+s.getSid()+"</td><td>"+s.getName()+"</td><td>"+s.getCity()+"</td><td>"+s.getCourse()+"</td><td>"+s.getMarks()+"</td></tr>");
	}
out.println("</table>");
%>
<a href="view.jsp?page=1">1..</a>
<a href="view.jsp?page=2">2..</a>
<a href="view.jsp?page=3">3..</a>
</body>
</html>