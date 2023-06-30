<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    Map<String, String> dic = new HashMap<>();
%>
<%
    PrintWriter printWriter = response.getWriter();
    dic.put("hello", "Xin chào");
    dic.put("how", "Thế Nào");
    dic.put("book", "Quyển vở");
    dic.put("computer", "Máy tính");
    String search = request.getParameter("search");
    String result = dic.get(search);
    if (result != null) {
        printWriter.println("Word: " + search);%>
<br>
<%
        printWriter.println("Result: " + result);
    } else {
        printWriter.println("Not found");
    }
%>
</body>
</html>
