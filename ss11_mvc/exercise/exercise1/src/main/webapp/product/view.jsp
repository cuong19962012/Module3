<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 7/3/2023
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/product-servlet">Back to product list</a>
</p>
<table>
    <tr>
        <td>Name:</td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${product.getPrice()}</td>
    </tr>
    <tr>
        <td>Description:</td>
        <td>${product.getDescription()}</td>
    </tr>
    <tr>
        <td>maker:</td>
        <td>${product.getMaker()}</td>
    </tr>
</table>
</body>
</html>
