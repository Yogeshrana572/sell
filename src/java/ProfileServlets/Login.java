package ProfileServlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import proprofile.Profile;
import proprofile.ProfileDao;
import proprofile.ProfileDaoImpl;

@WebServlet(urlPatterns = "/login")
public class Login extends HttpServlet{

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
//        req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
//    }
//    
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean log=false;
        ProfileDao pdao=new ProfileDaoImpl();
        List<Profile> list=pdao.getProfile();
        
//        System.out.println(req.getParameter("luser"));
//        System.out.println(req.getParameter("lpassword"));
        for(Profile proprofile :list){
            if(proprofile.getEmail().equalsIgnoreCase(req.getParameter("luser")) && proprofile.getPassword().equalsIgnoreCase(req.getParameter("lpassword"))){
                log=true;
                req.getSession().setAttribute("user", req.getParameter("luser"));
                req.getSession().setAttribute("password", req.getParameter("lpassword"));
                req.getSession().setAttribute("role", proprofile.getRole());
                req.getSession().setAttribute("name", proprofile.getName());
                break;
            }
        }
        if(log){
            System.out.println("Login Granted");
             resp.sendRedirect("index.jsp");
        }
        else{
            System.out.println("Login Denied");
            resp.sendRedirect("denied.jsp");
            
        }
    }
    
}
