package buyservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ordered.Ordered;
import ordered.OrderedDao;
import ordered.OrderedDaoImpl;

@WebServlet(urlPatterns = "/placeorder")
public class Place extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Ordered o=new Ordered();
        OrderedDao odao=new OrderedDaoImpl();
        o.setId(Integer.parseInt(req.getParameter("id")));
        o.setStatus("DISPATCHED");
        odao.update(o);
        resp.sendRedirect("ViewOrder.jsp");
    }
    
}
