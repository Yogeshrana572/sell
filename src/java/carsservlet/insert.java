package carsservlet;

import addcategory.AddCategory;
import addcategory.AddCategoryDao;
import addcategory.AddCategoryDaoImpl;
import cars.Cars;
import cars.CarsDao;
import cars.CarsDaoImpl;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
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
import supplier.Supplier;
import supplier.SupplierDao;
import supplier.SupplierDaoImpl;

@WebServlet(urlPatterns = "/addnewcars")
@MultipartConfig(maxFileSize = 10*1024*1024,maxRequestSize = 20*1024*1024,fileSizeThreshold = 5*1024*1024)
public class insert extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        Connection conn=database.Database.getInstance().getConnection();

    Cars cr=new Cars();
    CarsDao crdao=new CarsDaoImpl();
    
    
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
        
        // getting category id
        
        AddCategoryDao cdao=new AddCategoryDaoImpl();
        AddCategory c=cdao.getAddCategory(req.getParameter("cate"));
        
        
        cr.setCr_catid(c.getId());
        
        //getting company id
        
        CompanyDao comdao=new CompanyDaoImpl();
        Company cm=comdao.getCompany(req.getParameter("comp"));
        
        cr.setCr_comp(String.valueOf(cm.getC_name()));
        
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
        
        cr.setCr_img(String.valueOf(uploadResult.get("secure_url")));
        ProfileDao pdao=new ProfileDaoImpl();
        Profile pro=pdao.getProfile(req.getSession().getAttribute("user").toString());        
        cr.setCr_supid(pro.getId());
        
        crdao.insert(cr);
        System.out.println("Inserted");
        resp.sendRedirect("ViewCars.jsp");
    }
    
    
}
