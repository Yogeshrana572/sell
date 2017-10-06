package cars;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CarsDaoImpl  implements CarsDao{
String aURL="";
    @Override
    public void insert(Cars cr) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into newcars(cr_comp, cr_name, cr_model, cr_color, cr_speed, cr_seat, cr_fuel, cr_fuelcap, cr_transmission, "
                    + "cr_price, cr_features, cr_img, cr_catid, cr_supid) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(query);
            
            ps.setString(1, cr.getCr_comp());
            ps.setString(2, cr.getCr_name());
            ps.setString(3, cr.getCr_model());
            ps.setString(4, cr.getCr_color());
            ps.setString(5, cr.getCr_speed());
            ps.setString(6, cr.getCr_seat());
            ps.setString(7, cr.getCr_fuel());
            ps.setString(8, cr.getCr_fuelcap());
            ps.setString(9, cr.getCr_transmission());
            ps.setString(10, cr.getCr_price());
            ps.setString(11, cr.getCr_features());
            ps.setString(12, cr.getCr_img());
            ps.setInt(13, cr.getCr_catid());
            ps.setInt(14, cr.getCr_supid());
            ps.executeUpdate();
            System.out.println("Inserted");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="delete from newcars where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Cars cr) {
                try {
            Connection conn=database.DatabaseCat.getInstance().getConnection();
            PreparedStatement ps;
            if(cr.getCr_img().equals("")){
                System.out.println("Image not Found");
                ps=conn.prepareStatement("update newcars set cr_comp='"+cr.getCr_comp()+"', cr_name='"+cr.getCr_name()+"', cr_model='"+cr.getCr_model()+"', cr_color='"+cr.getCr_color()+"', cr_speed='"+cr.getCr_speed()+"', cr_seat='"+cr.getCr_seat()+"', cr_fuel='"+cr.getCr_fuel()+"', cr_fuelcap='"+cr.getCr_fuelcap()+"', cr_transmission='"+cr.getCr_transmission()+"', cr_price='"+cr.getCr_price()+"', cr_features='"+cr.getCr_features()+"',  cr_supid="+cr.getCr_supid()+" where id="+cr.getId());
            }else{
                ps=conn.prepareStatement("update newcars set cr_comp='"+cr.getCr_comp()+"',cr_name='"+cr.getCr_name()+"',cr_model='"+cr.getCr_model()+"',cr_color='"+cr.getCr_color()+"',cr_speed='"+cr.getCr_speed()+"',cr_seat='"+cr.getCr_seat()+"',cr_fuel='"+cr.getCr_fuel()+"',cr_fuelcap='"+cr.getCr_fuelcap()+"',cr_transmission='"+cr.getCr_transmission()+"',cr_price='"+cr.getCr_price()+"',cr_features='"+cr.getCr_features()+"', cr_supid="+cr.getCr_supid()+", cr_img='"+cr.getCr_img()+"' where id="+cr.getId());
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
    public Cars getCars(int id) {
           Cars cr=new Cars(); 
        try{
        Connection conn=database.Database.getInstance().getConnection();
        String query="select * from newcars where id="+id;
        PreparedStatement ps=conn.prepareStatement(query);
        ResultSet rs=ps.executeQuery();
        
        while(rs.next()){
         
            cr.setId(rs.getInt("id"));
            cr.setCr_comp(rs.getString("cr_comp"));
            cr.setCr_name(rs.getString("cr_name"));
            cr.setCr_model(rs.getString("cr_model"));
            cr.setCr_color(rs.getString("cr_color"));
            cr.setCr_speed(rs.getString("cr_speed"));
            cr.setCr_seat(rs.getString("cr_seat"));
            cr.setCr_fuel(rs.getString("cr_fuel"));
            cr.setCr_fuelcap(rs.getString("cr_fuelcap"));
            cr.setCr_transmission(rs.getString("cr_transmission"));
            cr.setCr_price(rs.getString("cr_price"));
            cr.setCr_features(rs.getString("cr_features"));
            cr.setCr_img(rs.getString("cr_img"));
            cr.setCr_catid(rs.getInt("cr_catid"));
            cr.setCr_supid(rs.getInt("cr_supid"));        
        
        }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return cr;
    }

    @Override
    public List<Cars> getCars() {
        List<Cars> list=new ArrayList<>();
        try{
        Connection conn=database.Database.getInstance().getConnection();
        String query="select * from newcars";
        PreparedStatement ps=conn.prepareStatement(query);
        ResultSet rs=ps.executeQuery();
        
        while(rs.next()){
            Cars cr=new Cars();
  
            cr.setId(rs.getInt("id"));
            cr.setCr_comp(rs.getString("cr_comp"));
            cr.setCr_name(rs.getString("cr_name"));
            cr.setCr_model(rs.getString("cr_model"));
            cr.setCr_color(rs.getString("cr_color"));
            cr.setCr_speed(rs.getString("cr_speed"));
            cr.setCr_seat(rs.getString("cr_seat"));
            cr.setCr_fuel(rs.getString("cr_fuel"));
            cr.setCr_fuelcap(rs.getString("cr_fuelcap"));
            cr.setCr_transmission(rs.getString("cr_transmission"));
            cr.setCr_price(rs.getString("cr_price"));
            cr.setCr_features(rs.getString("cr_features"));
            
            cr.setCr_supid(rs.getInt("cr_supid"));
            cr.setCr_img(rs.getString("cr_img"));
            cr.setCr_catid(rs.getInt("cr_catid"));
            list.add(cr);
        }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Cars> getCar(int cat) {
        List<Cars> list=new ArrayList<>();
        try{
        Connection conn=database.Database.getInstance().getConnection();
        String query="select * from newcars where id = "+cat+" order by cr_name";
        PreparedStatement ps=conn.prepareStatement(query);
        ResultSet rs=ps.executeQuery();
        
        while(rs.next()){
            Cars cr=new Cars();
            cr.setId(rs.getInt("id"));
            cr.setCr_comp(rs.getString("cr_comp"));
            cr.setCr_name(rs.getString("cr_name"));
            cr.setCr_model(rs.getString("cr_model"));
            cr.setCr_color(rs.getString("cr_color"));
            cr.setCr_speed(rs.getString("cr_speed"));
            cr.setCr_seat(rs.getString("cr_seat"));
            cr.setCr_fuel(rs.getString("cr_fuel"));
            cr.setCr_fuelcap(rs.getString("cr_fuelcap"));
            cr.setCr_transmission(rs.getString("cr_transmission"));
            cr.setCr_price(rs.getString("cr_price"));
            cr.setCr_features(rs.getString("cr_features"));
            
         
            cr.setCr_img(rs.getString("cr_img"));
            cr.setCr_catid(rs.getInt("cr_catid"));
               cr.setCr_supid(rs.getInt("cr_supid"));
            list.add(cr);
        }
        }
        catch(Exception e){
            e.printStackTrace();
        }
       return list; 
    }


    @Override
    public List<Cars> getCarC(String car) {
        
  
           List<Cars> list=new ArrayList<>();
        try{
        Connection conn=database.Database.getInstance().getConnection();
        String query="select * from newcars where cr_comp like '"+car+"'";
        PreparedStatement ps=conn.prepareStatement(query);
        ResultSet rs=ps.executeQuery();
        
        while(rs.next()){
            Cars cr=new Cars();
            cr.setId(rs.getInt("id"));
            cr.setCr_comp(rs.getString("cr_comp"));
            cr.setCr_name(rs.getString("cr_name"));
            cr.setCr_model(rs.getString("cr_model"));
            cr.setCr_color(rs.getString("cr_color"));
            cr.setCr_speed(rs.getString("cr_speed"));
            cr.setCr_seat(rs.getString("cr_seat"));
            cr.setCr_fuel(rs.getString("cr_fuel"));
            cr.setCr_fuelcap(rs.getString("cr_fuelcap"));
            cr.setCr_transmission(rs.getString("cr_transmission"));
            cr.setCr_price(rs.getString("cr_price"));
            cr.setCr_features(rs.getString("cr_features"));
            
            
            cr.setCr_img(rs.getString("cr_img"));
            cr.setCr_catid(rs.getInt("cr_catid"));
            cr.setCr_supid(rs.getInt("cr_supid"));
            list.add(cr);
        }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Cars> getCarC(int cat) {
        List<Cars> list=new ArrayList<>();
        try{
        Connection conn=database.Database.getInstance().getConnection();
        String query="select * from newcars where cr_catid = "+cat+" order by cr_name";
        PreparedStatement ps=conn.prepareStatement(query);
        ResultSet rs=ps.executeQuery();
        
        while(rs.next()){
            Cars cr=new Cars();
            cr.setId(rs.getInt("id"));
            cr.setCr_comp(rs.getString("cr_comp"));
            cr.setCr_name(rs.getString("cr_name"));
            cr.setCr_model(rs.getString("cr_model"));
            cr.setCr_color(rs.getString("cr_color"));
            cr.setCr_speed(rs.getString("cr_speed"));
            cr.setCr_seat(rs.getString("cr_seat"));
            cr.setCr_fuel(rs.getString("cr_fuel"));
            cr.setCr_fuelcap(rs.getString("cr_fuelcap"));
            cr.setCr_transmission(rs.getString("cr_transmission"));
            cr.setCr_price(rs.getString("cr_price"));
            cr.setCr_features(rs.getString("cr_features"));
            
            
            cr.setCr_img(rs.getString("cr_img"));
            cr.setCr_catid(rs.getInt("cr_catid"));
            cr.setCr_supid(rs.getInt("cr_supid"));
            list.add(cr);
        }
        }
        catch(Exception e){
            e.printStackTrace();
        }
       return list;
    }
    
}
