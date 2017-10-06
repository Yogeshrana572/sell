package proprofile;

import java.util.List;

public interface ProfileDao {
    
    void insert(Profile p);
    void delete(int id);
    void update(Profile p);
    
    Profile getProfile(int id);
    
    Profile getProfile(String email);
    List<Profile> getProfile();
    List<Profile> getSupplier();
}
