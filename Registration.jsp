<!DOCTYPE html>
<head>
    <title>JSP Registration Form</title>
</head>
<body>
    <h2>Registration Form</h2>
    <form action="insertdata.jsp" method="post">
        <label for="reg_id">Registration ID :</label>
        <input type="text" id="reg_id" name="reg_id" required>

        <label for="name">Name :</label>
        <input type="text" id="name" required>

        <label for="department">Department :</label>
        <select name="department" id="department" required> 
            <option value="">Select Department</option>
            <option value="IT">IT</option>
            <option value="MCA">MCA</option>
            <option value="BCA">BCA</option>
        </select>

        <label for="email">Email :</label>
        <input type="text" id="email" name="email" required>

        <label for="cell_number">Cell Number :</label>
        <input type="text" id="cell_number" name="cell" required>

        <input type="submit" value="Register">
    </form>
</body>