<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


    <%
        String regno = request.getParameter("regno");
        String name = request.getParameter("name");
        String branch = request.getParameter("branch");
        String email = request.getParameter("email");
        String cell = request.getParameter("cell");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vfstr", "root", "");

            if (regno != null && name != null && branch != null && email != null && cell != null) {
                pst = con.prepareStatement("INSERT INTO info(regno, name, branch, email, cell) VALUES (?, ?, ?, ?, ?)");
                pst.setString(1, regno);
                pst.setString(2, name);
                pst.setString(3, branch);
                pst.setString(4, email);
                pst.setString(5, cell);

                int rows = pst.executeUpdate();

                if (rows > 0) {
                    out.println("<script>alert('Details stored successfully');</script>");
                } else {
                    out.println("<script>alert('Error storing details');</script>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('An error occurred: " + e.getMessage() + "');</script>");
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

