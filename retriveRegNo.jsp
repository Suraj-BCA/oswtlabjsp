<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Search Student Information</title>
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
    <h1>Search Student Information</h1>
    <form method="post" action="retriveRegNo.jsp">
        <label for="regno">Enter Registration Number:</label>
        <input type="text" name="regno" required>
        <input type="submit" value="Search">
    </form>

    <%
        String regno = request.getParameter("regno");
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        if (regno != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vfstr", "root", "");

                pst = con.prepareStatement("SELECT * FROM info WHERE regno = ?");
                pst.setString(1, regno);
                rs = pst.executeQuery();

                if (rs.next()) {
                    String name = rs.getString("name");
                    String branch = rs.getString("branch");
                    String email = rs.getString("email");
                    String cell = rs.getString("cell");
        %>
                    <h2>Student Details</h2>
                    <table>
                        <tr>
                            <th>Registration No</th>
                            <th>Name</th>
                            <th>Branch</th>
                            <th>Email</th>
                            <th>Cell</th>
                        </tr>
                        <tr>
                            <td><%= regno %></td>
                            <td><%= name %></td>
                            <td><%= branch %></td>
                            <td><%= email %></td>
                            <td><%= cell %></td>
                        </tr>
                    </table>
        <%
                } else {
                    out.println("<p>No student found with the provided registration number.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>An error occurred: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
