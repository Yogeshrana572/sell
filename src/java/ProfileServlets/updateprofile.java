package ProfileServlets;

import company.Company;
import company.CompanyDao;
import company.CompanyDaoImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import proprofile.Profile;
import proprofile.ProfileDao;
import proprofile.ProfileDaoImpl;
import supplier.Supplier;
import supplier.SupplierDao;
import supplier.SupplierDaoImpl;

@WebServlet(urlPatterns = {"/doupdate"})
public class updateprofile extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        int id=Integer.parseInt(req.getParameter("id"));
        String data[]=req.getParameterValues("signup");
        
        Profile p=new Profile();
        ProfileDao pdao=new ProfileDaoImpl();
        
        p.setId(id);
        p.setName(req.getParameter("name"));
        p.setEmail(req.getParameter("email"));
        p.setPassword(req.getParameter("password"));
        p.setContact(req.getParameter("contact"));
        p.setAddress(req.getParameter("address"));

        
        if(req.getParameter("supe").equals("role"))
            p.setRole("Buyer");
        else
            p.setRole(req.getParameter("supe"));
        
        pdao.update(p);
        
        if(req.getParameter("supe").equals("Supplier"))
        {
            System.out.println("Supplier Found");
            
            CompanyDao cdao=new CompanyDaoImpl();
            
            Company c=cdao.getCompany(req.getParameter("cName"));
            
            System.out.println(""+c.getC_name());
            
            p=pdao.getProfile(req.getParameter("email"));
            
            Supplier s=new Supplier();
            
            s.setCompany_name(c.getC_name());
            s.setSupplier_id(p.getId());
            
            
            SupplierDao sdao=new SupplierDaoImpl();
            
            sdao.insert(s);
        }
        else{
            System.out.println("Supplier not Found");
        }
            
        resp.sendRedirect("index.jsp");
        
    }
    
    
}
