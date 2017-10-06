package supplier;

import java.util.List;

public interface SupplierDao {
     void insert(Supplier s);
    void delete(int id);
    void deleteS(int Sid);
    void update(Supplier s);
    
    Supplier getSupplierS(int sid);
    Supplier getSupplier(int id);
    
    List<Supplier> getSuppliers(int cid);
    List<Supplier> getSupplierC(String C_name);
    List<Supplier> getSupplier();
    List<Supplier> getSupplierD();
}
