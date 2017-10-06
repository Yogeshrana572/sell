package companyservlet;

import company.CompanyDao;
import company.CompanyDaoImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/DeleteCompany")
public class Delete extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("id"));
        CompanyDao cdao=new CompanyDaoImpl();
        
        cdao.delete(id);
        resp.sendRedirect("ViewCompany.jsp");
        
    }
    
    
}
