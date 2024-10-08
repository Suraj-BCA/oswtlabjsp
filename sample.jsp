<html>
<head>
<title>JavaScript email validation</title>
<script language="javascript">
function validatePhone(text)
{
    var phoneno = /^\d{10}$/;
    
    if((text.value.match(phoneno)))
    {
      document.frm.txt.focus();
	  return true;
    }
    else
    {
      alert("message");
      return false;
    }
}
</script>
</head>
<body onload='document.frm.txt.focus()'>
<h2>Input an email and Submit</h2>
<form name="frm" action="test.html" onSubmit="return validatePhone(document.frm.txt)"> 
<input type="text" name="txt"/>
<br><br>
<input type="submit" name="submit" value="Submit"/>
</form>
</body>
</html>