package com.example.exercise1;
import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        float price = Float.parseFloat(request.getParameter("price"));
        float percent = Float.parseFloat(request.getParameter("percent"));
        float amount = price * percent * 0.01f;
        float calculatedPrice = price - amount;
        request.setAttribute("result",calculatedPrice);
        request.setAttribute("amount",amount);
        RequestDispatcher dispatcher=request.getRequestDispatcher("display_discount.jsp");
        dispatcher.forward(request,response);

    }

    public void destroy() {
    }
}