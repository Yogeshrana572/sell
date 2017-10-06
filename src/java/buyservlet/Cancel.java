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

@WebServlet(urlPatterns = "/cancelorder")
public class Cancel extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Ordered o=new Ordered();
        OrderedDao odao=new OrderedDaoImpl();
        o.setId(Integer.parseInt(req.getParameter("id")));
        o.setStatus("CANCELLED");
        odao.update(o);
        
        resp.sendRedirect("ViewOrders.jsp");
    }
    
}
