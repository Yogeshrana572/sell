package proprofile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProfileDaoImpl implements ProfileDao{

    @Override
    public void insert(Profile p) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into profile(name,email,password,contact,address,role) values(?,?,?,?,?,?)";
            
            PreparedStatement ps=conn.prepareStatement(query);
            
            ps.setString(1, p.getName().toUpperCase());
            ps.setString(2, p.getEmail());
            ps.setString(3, p.getPassword());
            ps.setString(4, p.getContact());
            ps.setString(5, p.getAddress());
            ps.setString(6, p.getRole());
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
          try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="delete from profile where id = ?";
            
            PreparedStatement ps=conn.prepareStatement(query);
            
            ps.setInt(1, id);
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Profile p) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            
            
            PreparedStatement ps=conn.prepareStatement("update profile set name=?,email=?,password=?,contact=?,address=?,role=? where id="+p.getId());
            
            ps.setString(1, p.getName());
            ps.setString(2, p.getEmail());
            ps.setString(3, p.getPassword());
            ps.setString(4, p.getContact());
            ps.setString(5, p.getAddress());
            ps.setString(6, p.getRole());
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Profile getProfile(int id) {
        Profile p =new Profile();
          try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from profile where id="+id;
            
            PreparedStatement ps=conn.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            
            while (rs.next()){
                
                p.setId(rs.getInt("ID"));
                p.setName(rs.getString("Name"));
                p.setEmail(rs.getString("Email"));
                p.setPassword(rs.getString("Password"));
                p.setContact(rs.getString("Contact"));
                p.setAddress(rs.getString("Address"));
                 p.setRole(rs.getString("Role"));
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public List<Profile> getProfile() {
        List<Profile> list =new ArrayList<Profile>();
          try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from profile";
            
            PreparedStatement ps=conn.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            
            while (rs.next()){
                Profile p=new Profile();
                
                p.setId(rs.getInt("ID"));
                p.setName(rs.getString("Name"));
                p.setEmail(rs.getString("Email"));
                p.setPassword(rs.getString("Password"));
                p.setContact(rs.getString("Contact"));
                p.setAddress(rs.getString("Address"));
                p.setRole(rs.getString("Role"));
                list.add(p);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Profile getProfile(String email) {
         Profile p=new Profile();
          try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from profile where email like '"+email+"' ";
            
            PreparedStatement ps=conn.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            
            while (rs.next()){
               
                
                p.setId(rs.getInt("ID"));
                p.setName(rs.getString("Name"));
                p.setEmail(rs.getString("Email"));
                p.setPassword(rs.getString("Password"));
                p.setContact(rs.getString("Contact"));
                p.setAddress(rs.getString("Address"));
                p.setRole(rs.getString("Role"));
                
                return p;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public List<Profile> getSupplier() {
       List<Profile> list =new ArrayList<Profile>();
          try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from profile where role like 'supplier'";
            
            PreparedStatement ps=conn.prepareStatement(query);
            
            ResultSet rs=ps.executeQuery();
            
            while (rs.next()){
                Profile p=new Profile();
                
                p.setId(rs.getInt("ID"));
                p.setName(rs.getString("Name"));
                p.setEmail(rs.getString("Email"));
                p.setPassword(rs.getString("Password"));
                p.setContact(rs.getString("Contact"));
                p.setAddress(rs.getString("Address"));
                p.setRole(rs.getString("Role"));
                list.add(p); 
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    
    
}
