<%page contentType="text/html" pageEncoding="UTF-8"%>
<%page import="java.sql.*"%>
<%
    String regno = request.getParameter("reg_id")
    String name = request.getParameter("name")
    String branch = request.getParameter("department")
    String email = request.getParameter("email")
    String cell = request.getParameter("cell")

    Connection con;
    PreparedStatment pst;
    ResultSet rs;

    Class.forName("con.mysqli.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vfstr");
    pst = con.prepareStatement("insert into info(regno, name, branch,email,cell)")
    pst.setString(1, regno);
    pst.setString(2, name);
    pst.setString(3, branch);
    pst.setString(4, email);
    pst.setString(5, cell);
    int rows = pst.executeUpdate();


    if (rows > 0 )
    {
%>
        <script>
            alert('Details stored successfully');
            window.location = 'registration.jsp';

        </script>
<%
    }
    else
    {
        
    }