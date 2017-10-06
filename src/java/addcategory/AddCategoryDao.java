package addcategory;

import java.io.File;
import java.util.List;

public interface AddCategoryDao {
void insert(AddCategory ac);
void delete(int id);
void update(AddCategory ac);
String findImage(String name,File file);

AddCategory getAddCategory(int id);
AddCategory getAddCategory(String Cat_Name);
List<AddCategory> getAddCategory();

   
}
