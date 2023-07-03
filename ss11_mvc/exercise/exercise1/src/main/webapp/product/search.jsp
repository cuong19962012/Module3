<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title></title>
</head>
<body>
<p>
    <a href="/product-servlet">Back to product list</a>
</p>
<form action="/product-servlet?action=search" method="post">
    <fieldset>
        <legend>Search Product</legend>
        <label for="name">Input Name Product</label>
        <input type="text" id="name" name="name"/>
        <input type="submit" value="Search">
    </fieldset>
<%--    <c:if test="${message!= null}">--%>
<%--        <span class="message">${message}</span>--%>
<%--    </c:if>--%>
    <c:if test="${products!=null}">
        <c:forEach var="product" items="products">
            <table>
                <tr>
                    <td>Name</td>
                    <td>Price</td>
                    <td>Description</td>
                    <td>Maker</td>
                </tr>
                <tr>
                    <td>${product.getName()}</td>
                    <td>${product.getPrice()}</td>
                    <td>${product.getDescription()}</td>
                    <td>${product.getMaker()}</td>
                </tr>
            </table>
        </c:forEach>
    </c:if>
</form>
</body>
</html>
