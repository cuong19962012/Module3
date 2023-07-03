package servlet;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        float operand1=Float.parseFloat(request.getParameter("operand1"));
        float operand2=Float.parseFloat(request.getParameter("operand2"));
        String operator=request.getParameter("operator");
        float result=0;
        if(operator.equals("add")){
            result=operand1+operand2;
        }
        if(operator.equals("sub")){
            result=operand1-operand2;
        }
        if(operator.equals("multi")){
            result=operand1*operand2;
        }
        if(operator.equals("div")){
           result=operand1/operand2;
        }
        request.setAttribute("result",result);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request,response);
    }

    public void destroy() {
    }
}