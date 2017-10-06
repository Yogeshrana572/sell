package supplier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SupplierDaoImpl implements SupplierDao{

    @Override
    public void insert(Supplier s) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into supdetail(supplier_id, company_name) values (?,?)";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setInt(1, s.getSupplier_id());
            ps.setString(2, s.getCompany_name());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="delete from supdetail where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    @Override
    public void deleteS(int Sid) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            PreparedStatement ps=conn.prepareStatement("delete from supdetail where supplier_id="+Sid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Supplier s) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            PreparedStatement ps= conn.prepareStatement("update supdetail set company_name = '"+s.getCompany_name()+"' where id="+s.getId());
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Supplier getSupplierS(int sid) {
        Supplier s=new Supplier();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            PreparedStatement ps=conn.prepareStatement("select * from supdetail where supplier_id="+sid);
            
            ResultSet rs=ps.executeQuery();
            
            while (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setSupplier_id(rs.getInt("supplier_id"));
                s.setCompany_name(rs.getString("Company_Name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    @Override
    public Supplier getSupplier(int id) {
        Supplier s=new Supplier();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            PreparedStatement ps=conn.prepareStatement("select * from supdetail where id="+id);
            
            ResultSet rs=ps.executeQuery();
            
            while (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setSupplier_id(rs.getInt("supplier_id"));
                s.setCompany_name(rs.getString("Company_Name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    @Override
    public List<Supplier> getSuppliers(int cid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Supplier> getSupplier() {
        List<Supplier> list=new ArrayList<>();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from supdetail ";
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                Supplier s=new Supplier();
                s.setId(rs.getInt("id"));
                s.setSupplier_id(rs.getInt("supplier_id"));
                s.setCompany_name(rs.getString("company_name"));
                
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public List<Supplier> getSupplierD() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Supplier> getSupplierC(String C_name) {
        List<Supplier> list=new ArrayList<>();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            PreparedStatement ps=conn.prepareStatement("select * from supdetail where company_name like '"+C_name+"'");
            
            ResultSet rs=ps.executeQuery();
            
            while (rs.next()) {
                Supplier s=new Supplier();

                s.setId(rs.getInt("id"));
                s.setSupplier_id(rs.getInt("supplier_id"));
                s.setCompany_name(rs.getString("Company_Name"));
                
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
