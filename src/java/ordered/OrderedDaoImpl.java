package ordered;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderedDaoImpl implements OrderedDao{

    @Override
    public void insert(Ordered o) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into orders(product, transactions, status,buyer,seller) values(?,?,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(query);
            
            ps.setInt(1, o.getProduct());
            ps.setInt(2, o.getTransactions());
            ps.setString(3, o.getStatus());
            ps.setInt(4, o.getBuyer());
            ps.setInt(5, o.getSeller());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="delete from orders where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    @Override
    public void update(Ordered o) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="update orders set status=? where id="+o.getId();
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, o.getStatus());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    @Override
    public Ordered getOrdered(int id) {
                Ordered o=new Ordered();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from orders where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
        
                o.setProduct(rs.getInt("Product"));
                o.setTransactions(rs.getInt("Transactions"));
                o.setStatus(rs.getString("Status"));
                o.setBuyer(rs.getInt("Buyer"));
                o.setSeller(rs.getInt("Seller"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }

    @Override
    public List<Ordered> getOrdered() {
        List<Ordered> list=new ArrayList<>();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from orders";
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Ordered o=new Ordered();
                o.setId(rs.getInt("Id"));
                o.setProduct(rs.getInt("Product"));
                o.setTransactions(rs.getInt("Transactions"));
                o.setStatus(rs.getString("Status"));
                o.setBuyer(rs.getInt("Buyer"));
                o.setSeller(rs.getInt("Seller"));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    @Override
    public Ordered getOrderedP(int id) {
                Ordered o=new Ordered();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from orders where transactions="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                o.setId(rs.getInt("id"));
                o.setProduct(rs.getInt("Product"));
                o.setTransactions(rs.getInt("Transactions"));
                o.setStatus(rs.getString("Status"));
                o.setBuyer(rs.getInt("Buyer"));
                o.setSeller(rs.getInt("Seller"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }
    
}
