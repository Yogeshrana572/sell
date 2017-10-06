package carsservlet;

import cars.CarsDao;
import cars.CarsDaoImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/deletecar")
public class delete extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        CarsDao crdao=new CarsDaoImpl();
        
        crdao.delete(id);
        System.out.println("Deleted");
        resp.sendRedirect("ViewCars.jsp");
    }
    
}
