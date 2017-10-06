package companyservlet;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import company.Company;
import company.CompanyDao;
import company.CompanyDaoImpl;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = "/updatecompany")
@MultipartConfig(maxFileSize = 10*1024*1024,maxRequestSize = 20*1024*1024,fileSizeThreshold = 5*1024*1024)
public class update extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        Company c=new Company();
        CompanyDao cdao=new CompanyDaoImpl();
//        String data[]=req.getParameterValues("addcar");
//        
        int id=Integer.parseInt(req.getParameter("id"));
////        for (int i=0;i<data.length;i++) {
////            System.out.println(i+"  "+data[i]);
////            
//        }
        c.setId(id);
        c.setC_name(req.getParameter("comp"));
        c.setC_desc(req.getParameter("compdesc"));
        
        System.out.println(Integer.parseInt(req.getParameter("id")));
        System.out.println(req.getParameter("comp"));
        System.out.println(req.getParameter("compdesc"));
        if(req.getPart("img").getInputStream().available()==0){
            
            System.out.println("image not found");
            c.setC_img("");
        }else{
            System.out.println("Uploading Image...");
            System.out.println("Finding image");
                    Part p= req.getPart("img");
                byte b[]= new byte[ p.getInputStream().available()];
                p.getInputStream().read(b);
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

                c.setC_img(String.valueOf(uploadResult.get("secure_url")));
        }
        cdao.update(c);
        System.out.println("Updated");
        resp.sendRedirect("ViewCompany.jsp");
    }
}
