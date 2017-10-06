package ordered;

import java.util.List;

public interface OrderedDao {
    
    void insert(Ordered o);
    void delete(int id);
    void update(Ordered o);
    
    Ordered getOrdered(int id);
    List<Ordered> getOrdered();
    
    Ordered getOrderedP(int id);
    
}
