<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cus</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="/ConverterServlet" method="post">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br>
    <labe>USD: </labe> <br>
    <input type="text" name="usd" placeholder="USD" value="0"><br>
    <input type="submit" id="submit" value="Converter"/>
</form>
</body>
</html>