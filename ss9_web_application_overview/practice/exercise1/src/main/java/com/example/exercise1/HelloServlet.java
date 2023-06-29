package com.example.exercise1;

import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;

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
        float calculated_price = price - amount;
        request.setAttribute("result",calculated_price);
        request.setAttribute("amount",amount);
        RequestDispatcher dispatcher=request.getRequestDispatcher("display_discount.jsp");
        dispatcher.forward(request,response);

    }

    public void destroy() {
    }
}