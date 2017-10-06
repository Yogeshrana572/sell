package carsservlet;

import cars.Cars;
import cars.CarsDao;
import cars.CarsDaoImpl;
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
import proprofile.Profile;
import proprofile.ProfileDao;
import proprofile.ProfileDaoImpl;

@WebServlet(urlPatterns = "/updatenewcars")
@MultipartConfig(maxFileSize = 10*1024*1024,maxRequestSize = 20*1024*1024,fileSizeThreshold = 5*1024*1024)
public class update extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cars cr=new Cars();
        CarsDao crdao=new CarsDaoImpl();
        int id=Integer.parseInt(req.getParameter("id"));
        cr.setId(id);
        cr.setCr_comp(req.getParameter("comp"));
        cr.setCr_name(req.getParameter("carn"));
        cr.setCr_model(req.getParameter("model"));
        cr.setCr_color(req.getParameter("color"));
        cr.setCr_speed(req.getParameter("speed"));
        cr.setCr_seat(req.getParameter("seat"));
        cr.setCr_fuel(req.getParameter("fuel"));
        cr.setCr_fuelcap(req.getParameter("fuelcap"));
        cr.setCr_transmission(req.getParameter("trans"));
        cr.setCr_price(req.getParameter("price"));
        cr.setCr_features(req.getParameter("feature"));
        
        ProfileDao pdao=new ProfileDaoImpl();
        Profile pro=pdao.getProfile(req.getSession().getAttribute("user").toString());
        
        cr.setCr_supid(pro.getId());
        if(req.getPart("img").getInputStream().available()==0){
            
            System.out.println("image not found");
            cr.setCr_img("");
        }
        else{
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
        cr.setCr_img(String.valueOf(uploadResult.get("secure_url")));
     
        
    }
        crdao.update(cr);
        System.out.println("updated");
        resp.sendRedirect("ViewCars.jsp");
    }
    
}
