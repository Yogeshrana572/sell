package categoryservlet;

import addcategory.AddCategory;
import addcategory.AddCategoryDao;
import addcategory.AddCategoryDaoImpl;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
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

@WebServlet(urlPatterns = "/updatecategory")
@MultipartConfig(maxFileSize = 10*1024*1024,maxRequestSize = 20*1024*1024,fileSizeThreshold = 5*1024*1024)
public class UpdateCategory extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        AddCategory ac=new AddCategory();
        AddCategoryDao acdao=new AddCategoryDaoImpl();
//        String data[]=req.getParameterValues("addcar");
//        
        int id=Integer.parseInt(req.getParameter("id"));
////        for (int i=0;i<data.length;i++) {
////            System.out.println(i+"  "+data[i]);
////            
//        }
        ac.setId(id);
        ac.setName(req.getParameter("name"));
        ac.setDescription(req.getParameter("desc"));
        
        if(req.getPart("img").getInputStream().available()==0){
            
            System.out.println("image not found");
            ac.setPhoto("");
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

            ac.setPhoto(String.valueOf(uploadResult.get("secure_url")));
            
            
        }
        
        
//        Part p= req.getPart("img");
//        byte b[]= new byte[ p.getInputStream().available()];
//        p.getInputStream().read(b);
//        System.out.println(this.getServletContext().getRealPath("/"));
//        
//        File f=new File(this.getServletContext().getRealPath("/") +"/image.jpg");
//        
//        FileOutputStream fos= new FileOutputStream(f);
//        fos.write(b);
//        fos.close();
//        
//        Cloudinary cld=new Cloudinary(ObjectUtils.asMap(
//        "cloud_name","yogesh","api_key","569193834155145","api_secret","dhWe7pSL0zMqviVaO0hy0nNWXPc"
//        ));
//        Map uploadResult=cld.uploader().upload(f,ObjectUtils.emptyMap());
//        System.out.println(uploadResult.get("secure_url"));
//        ac.setPhoto(String.valueOf(uploadResult.get("secure_url")));
        acdao.update(ac);
                
        System.out.println("Updated ");
        
        resp.sendRedirect("ViewCategory.jsp");   
    }
    
}
