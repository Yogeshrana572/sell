package addcategory;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class AddCategoryDaoImpl implements AddCategoryDao{
String aURL="";
    @Override
    public void insert(AddCategory ac) {
        InputStream inputstream=null;
        try {
            Connection conn=database.DatabaseCat.getInstance().getConnection();
            PreparedStatement ps=conn.prepareStatement("insert into adddetail(name,description,photo) values(?,?,?)");
            ps.setString(1, ac.getName());
            ps.setString(2, ac.getDescription());
            ps.setString(3, ac.getPhoto());
            
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
            String query="delete from adddetail where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ps.executeUpdate();
            
            System.out.println("deleted");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(AddCategory ac) {
         try {
            Connection conn=database.DatabaseCat.getInstance().getConnection();
            PreparedStatement ps;
            if(ac.getPhoto().equals("")){
                System.out.println("Image not Found");
                ps=conn.prepareStatement("update adddetail set name='"+ac.getName()+"',description='"+ac.getDescription()+"' where id="+ac.getId());
            }else{
                ps=conn.prepareStatement("update adddetail set name='"+ac.getName()+"',description='"+ac.getDescription()+"',photo='"+ac.getPhoto()+"' where id="+ac.getId());
            }
            
            int s = ps.executeUpdate();
            if(s>0) 
                System.out.println("Uploaded successfully !");
            else 
                System.out.println(" nooo :( !");

            
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public AddCategory getAddCategory(int id) {
      AddCategory ac=new AddCategory();
        try {
            Connection conn=database.DatabaseCat.getInstance().getConnection();
            String query="select * from adddetail where id="+id;
            
            PreparedStatement ps=conn.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
               
                ac.setId(rs.getInt(1));
                ac.setName(rs.getString(2));
                ac.setDescription(rs.getString(3));
                
                ac.setPhoto(rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return ac;
    }

    @Override
    public List<AddCategory> getAddCategory() {
        List<AddCategory> list =new ArrayList<AddCategory>();
        
        try {
            Connection conn=database.DatabaseCat.getInstance().getConnection();
            String query="select * from adddetail";
            
            PreparedStatement ps=conn.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                AddCategory ac=new AddCategory();
                ac.setId(rs.getInt(1));
                ac.setName(rs.getString(2));
                ac.setDescription(rs.getString(3));
                ac.setPhoto(rs.getString(4));
                list.add(ac);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
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
    public AddCategory getAddCategory(String Cat_Name) {
        AddCategory c=new AddCategory();
        try {
            Connection conn=database.DatabaseCat.getInstance().getConnection();
            String query="select * from adddetail where name like '"+Cat_Name+"'";
            
            PreparedStatement ps=conn.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                c.setId(rs.getInt(1));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    }
    

