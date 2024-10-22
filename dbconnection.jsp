<%@page import="java.sql.*"  %> 
<%! Connection con;
Statement st;
ResultSet rs;
%>	 
<% 
try 
{ 
Class.forName("com.mysql.jdbc.Driver"); 
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oswt","root",""); 
st=con.createStatement(); 
rs=st.executeQuery("SELECT * from login"); 
%> 
<% 
} 
catch(Exception e) 
{ 
	e.printStackTrace(); 
} 
%> 