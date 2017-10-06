package ProfileServlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import proprofile.Profile;
import proprofile.ProfileDao;
import proprofile.ProfileDaoImpl;
import supplier.SupplierDao;
import supplier.SupplierDaoImpl;

@WebServlet(urlPatterns = {"/deletefromdb"})
public class deleteprofile extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        
        Profile p=new Profile();
        ProfileDao pdao=new ProfileDaoImpl();
        
        SupplierDao sdao=new SupplierDaoImpl();
        sdao.deleteS(id);
        
        pdao.delete(id);
        
        if(req.getSession().getAttribute("role").toString().equals("Admin") && !req.getSession().getAttribute("user").toString().equalsIgnoreCase(p.getEmail())){
        resp.sendRedirect("ViewProfile.jsp");
    }
        else{
                req.getSession().removeAttribute("user");
                req.getSession().removeAttribute("password");
                req.getSession().removeAttribute("role");
                req.getSession().removeAttribute("name");
                req.setAttribute("error", "<script>alert(' Profile Deleted')</script>");
                RequestDispatcher rq=req.getRequestDispatcher("index.jsp");
                rq.forward(req, resp);
                }
    }
    
    
}
