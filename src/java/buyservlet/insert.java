package buyservlet;

import buy.Buy;
import buy.BuyDao;
import buy.BuyDaoImpl;
import cars.Cars;
import cars.CarsDao;
import cars.CarsDaoImpl;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ordered.Ordered;
import ordered.OrderedDao;
import ordered.OrderedDaoImpl;
import proprofile.Profile;
import proprofile.ProfileDao;
import proprofile.ProfileDaoImpl;

@WebServlet(urlPatterns = "/carddetail")
public class insert  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Connection conn=database.Database.getInstance().getConnection();
//        String data[]=req.getParameterValues("bank");

            Buy b=new Buy();
            BuyDao bdao=new BuyDaoImpl();
            
            b.setBank(req.getParameter("bank"));
            b.setExpire_date(req.getParameter("expire"));
            b.setCvv(req.getParameter("cvv"));
            b.setHolder(req.getParameter("holder"));
            b.setCard(req.getParameter("card"));
            
            bdao.insert(b);
            b=bdao.getBuy(req.getParameter("card"));
            
            OrderedDao odao=new OrderedDaoImpl();
            Ordered o=new  Ordered();
            
            ProfileDao pdao=new ProfileDaoImpl();
            Profile p=pdao.getProfile(req.getSession().getAttribute("user").toString());
            
            CarsDao cdao=new CarsDaoImpl();
            Cars c=cdao.getCars(Integer.parseInt(req.getParameter("id")));
            
            o.setProduct(Integer.parseInt(req.getParameter("id")));
            o.setTransactions(b.getId());
            o.setStatus("ORDERED");
            o.setSeller(c.getCr_supid());
            o.setBuyer(p.getId());
            
            odao.insert(o);
            
                System.out.println("inserted");
            resp.sendRedirect("Orderdetail.jsp?id="+b.getId());
    }
    
}
