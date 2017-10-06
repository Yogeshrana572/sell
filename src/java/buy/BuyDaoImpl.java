package buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BuyDaoImpl implements BuyDao{

    @Override
    public void insert(Buy b) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="insert into account(bank,expire_date,cvv,holder,card) values(?,?,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, b.getBank());
            ps.setString(2, b.getExpire_date());
            ps.setString(3, b.getCvv());
            ps.setString(4, b.getHolder());
            ps.setString(5, b.getCard());
            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="delete from account where id = "+id;
            PreparedStatement ps=conn.prepareStatement(query);            
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Buy getBuy(int id) {
                Buy b=new Buy();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from account where id="+id;
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
              
                b.setId(rs.getInt("id"));
                b.setBank(rs.getString("bank"));
                b.setExpire_date(rs.getString("expire_date"));
                b.setCvv(rs.getString("cvv"));
                b.setHolder(rs.getString("holder"));
                b.setCard(rs.getString("card"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public List<Buy> getBuy() {
        List<Buy> list=new ArrayList<>();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from account";
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Buy b=new Buy();
                b.setId(rs.getInt("id"));
                b.setBank(rs.getString("bank"));
                b.setExpire_date(rs.getString("expire_date"));
                b.setCvv(rs.getString("cvv"));
                b.setHolder(rs.getString("holder"));
                b.setCard(rs.getString("card"));
                
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Buy getBuy(String card) {
              Buy b=new Buy();
        try {
            Connection conn=database.Database.getInstance().getConnection();
            String query="select * from account where card like '"+card+"'";
            PreparedStatement ps=conn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
              
                b.setId(rs.getInt("id"));
                b.setBank(rs.getString("bank"));
                b.setExpire_date(rs.getString("expire_date"));
                b.setCvv(rs.getString("cvv"));
                b.setHolder(rs.getString("holder"));
                b.setCard(rs.getString("card"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
    
}
