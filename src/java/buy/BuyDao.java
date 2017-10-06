package buy;

import java.util.List;

public interface BuyDao {
    void insert(Buy b);
    void delete(int id);
    
    Buy getBuy(int id);
    Buy getBuy(String card);
    List<Buy> getBuy();
    
}
