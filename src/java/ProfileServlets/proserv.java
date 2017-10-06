package ProfileServlets;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import supplier.Supplier;
import supplier.SupplierDao;
import supplier.SupplierDaoImpl;
import company.Company;
import company.CompanyDao;
import company.CompanyDaoImpl;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import proprofile.Profile;
import proprofile.ProfileDao;
import proprofile.ProfileDaoImpl;

@WebServlet(urlPatterns = "/dosignup")
@MultipartConfig(maxFileSize = 10*1024*1024,maxRequestSize = 20*1024*1024,fileSizeThreshold = 5*1024*1024)
public class proserv extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String data[]=req.getParameterValues("signup");
        
        //Connection conn=database.Database.getInstance().getConnection();
        
        Profile p=new Profile();
        
        ProfileDao pdao=new ProfileDaoImpl();
        
        p.setName(req.getParameter("name"));
        p.setEmail(req.getParameter("email"));
        p.setPassword(req.getParameter("password"));
        p.setContact(req.getParameter("contact"));
        p.setAddress(req.getParameter("address"));
        
        if(req.getParameter("supe").equals("role"))
            p.setRole("Buyer");
        else
            p.setRole(req.getParameter("supe"));
        
        
        pdao.insert(p);
        
        if(req.getParameter("supe").equals("Supplier"))
        {
            System.out.println("Supplier Found");
            CompanyDao cdao=new CompanyDaoImpl();
            
            Company c=new Company();
            
           if(req.getParameter("cName").equalsIgnoreCase("other")){
               c.setC_name(req.getParameter("compn"));
               c.setC_desc(req.getParameter("desc"));
             
                Part pa= req.getPart("img");
                byte b[]= new byte[ pa.getInputStream().available()];
                pa.getInputStream().read(b);
                System.out.println(this.getServletContext().getRealPath("/"));

                File f=new File(this.getServletContext().getRealPath("/") +"/image.jpg");

                FileOutputStream fos= new FileOutputStream(f);
                fos.write(b);
                fos.close();

                Cloudinary cld=new Cloudinary(ObjectUtils.asMap(
                "cloud_name","yogesh","api_key","569193834155145","api_secret","dhWe7pSL0zMqviVaO0hy0nNWXPc"
                ));
                Map uploadResult=cld.uploader().upload(f,ObjectUtils.emptyMap());
                System.out.println(uploadResult.get("secure_url"));
                c.setC_img(uploadResult.get("secure_url").toString());
                cdao.insert(c);
                c=cdao.getCompany(req.getParameter("compn"));
                
           }else{
               c=cdao.getCompany(req.getParameter("cName"));
           }
            
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
    
    
    

