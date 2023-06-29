<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/hello-servlet" method="post">
    <labe>Product Description</labe>
    <input type="text" name="description"><br>
    <labe>List Price</labe>
    <input type="text" name="price"><br>
    <labe>Discount Percent</labe>
    <input type="text" name="percent"><br>
    <button>current</button>
</form>
</body>
</html>