package company;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CompanyDaoImpl implements CompanyDao{
String aURL="";
    @Override
    public void insert(Company c) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into compdetail(c_name,c_desc,c_img) values(?,?,?)";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, c.getC_name());
            ps.setString(2, c.getC_desc());
            ps.setString(3, c.getC_img());
            
            int s = ps.executeUpdate();
                if(s>0) 
                    System.out.println("Uploaded successfully !");
                else 
                    System.out.println(" nooo :( !");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
     
        
        try {
            Connection conn=database.DatabaseCat.getInstance().getConnection();
            String query="delete from compdetail where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ps.executeUpdate();
            
            System.out.println("deleted");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Company c) {
        try {
            Connection conn=database.DatabaseCat.getInstance().getConnection();
            PreparedStatement ps;
            if(c.getC_img().equals("")){
                System.out.println("Image not Found");
                ps=conn.prepareStatement("update compdetail set c_name='"+c.getC_name()+"', c_desc='"+c.getC_desc()+"' where id="+c.getId());
            }else{
                ps=conn.prepareStatement("update compdetail set c_name='"+c.getC_name()+"',c_desc='"+c.getC_desc()+"',c_img='"+c.getC_img()+"' where id="+c.getId());
                System.out.println("full updated with image");
            }
            
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String findImage(String name, File file) {
         File[] list = file.listFiles();
        if(list!=null)
        for (File fil : list)
        {
            if (fil.isDirectory())
            {
                findImage(name,fil);
            }
            else if (name.equalsIgnoreCase(fil.getName()))
            {
                System.out.println("Full path of the image: "+fil.getParentFile()+"\\"+name);
                aURL=String.valueOf(fil.getParentFile()+"\\"+name);
                System.out.println(aURL);
            }
        }
        return aURL;
    }

    @Override
    public Company getCompany(int id) {
        Company c=new Company();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from compdetail where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                
                c.setId(rs.getInt(1));
                c.setC_name(rs.getString(2));
                c.setC_desc(rs.getString(3));
                c.setC_img(rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    @Override
    public List<Company> getCompany() {
        List<Company> list=new ArrayList<>();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from compdetail";
            PreparedStatement ps=conn.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Company c=new Company();
                c.setId(rs.getInt(1));
                c.setC_name(rs.getString(2));
                c.setC_desc(rs.getString(3));
                c.setC_img(rs.getString(4));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Company getCompany(String name) {
        Company c=new Company();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from compdetail where C_name like '"+name+"'";
            PreparedStatement ps=conn.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                System.out.println(rs.getInt(1));
                c.setId(rs.getInt(1));
                c.setC_name(rs.getString(2));
                c.setC_desc(rs.getString(3));
                c.setC_img(rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }
}
