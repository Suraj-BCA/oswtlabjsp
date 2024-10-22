<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Student Information</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Stored Student Information</h1>
    <table>
        <tr>
            <th>Registration No</th>
            <th>Name</th>
            <th>Branch</th>
            <th>Email</th>
            <th>Cell</th>
        </tr>
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vfstr", "root", "");

                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM info");

                while (rs.next()) {
                    String regno = rs.getString("regno");
                    String name = rs.getString("name");
                    String branch = rs.getString("branch");
                    String email = rs.getString("email");
                    String cell = rs.getString("cell");
        %>
                    <tr>
                        <td><%= regno %></td>
                        <td><%= name %></td>
                        <td><%= branch %></td>
                        <td><%= email %></td>
                        <td><%= cell %></td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<tr><td colspan='5'>An error occurred: " + e.getMessage() + "</td></tr>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
</body>
</html>
