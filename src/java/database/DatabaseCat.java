package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseCat {
    
    private static DatabaseCat obj=new DatabaseCat();
    
    private Connection conn;
    
    private DatabaseCat(){
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn=DriverManager.getConnection("jdbc:derby://localhost:1527/sell","sell","sell");
            System.out.println("Connected");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static DatabaseCat getInstance(){
        return obj;
    }
    
    public Connection getConnection(){
        return conn;
    }
}
