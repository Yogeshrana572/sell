package cars;

import java.io.File;
import java.util.List;

public interface CarsDao {
    
    void insert(Cars cr);
    void delete(int id);
    void update(Cars cr);
    
    String findImage(String name, File file);
    Cars getCars( int id);
    List<Cars> getCars();
    List<Cars> getCar(int cat);
    List<Cars> getCarC(int cat);
    List<Cars> getCarC(String car);
    
}
