package company;

import java.io.File;
import java.util.List;

public interface CompanyDao {
    void insert(Company c);
    void delete(int id);
    void update(Company c);
    String findImage(String name, File file);
    
    Company getCompany(int id);
    Company getCompany(String name);
    List<Company> getCompany();
    
}
