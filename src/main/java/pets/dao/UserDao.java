package pets.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import pets.model.User;

public class UserDao {
	Connection con ;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    
	//method for saving user to database 
    public boolean saveUser(User user){
        boolean set = false;
        try{
            //Insert register data to database
            String query = "insert into user(name,address,city,zip,email,phone,password) values(?,?,?,?,?,?,?)";
           
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1, user.getName());
           pt.setString(2, user.getAddress());
           pt.setString(3, user.getCity());
           pt.setString(4, user.getZip());
           pt.setString(5, user.getEmail());
           pt.setString(6, user.getPhone());
           pt.setString(7, user.getPassword());
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
    
    //method to log in user
    
    public User loguser(String email, String pass){
        User usr=null;
        try{
            String query ="select * from user where email=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs.next()){
                usr = new User();
                usr.setId(rs.getInt("id"));
                usr.setName(rs.getString("name"));
                usr.setAddress(rs.getString("address"));
                usr.setCity(rs.getString("city"));
                usr.setZip(rs.getString("zip"));
                usr.setEmail(rs.getString("email"));
                usr.setPhone(rs.getString("phone"));
                usr.setPassword(rs.getString("password"));
                
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return usr;
    }
	
//method to update user	
public boolean updateUser(User user) {
    	boolean set = false;
    	
    	try {
    		
    		String query = "update user set name = ?, address = ?, city = ?, zip = ?, email = ?, phone = ?, password = ? where id = ?";
    		PreparedStatement s = this.con.prepareStatement(query);
    		s.setString(1, user.getName());
            	s.setString(2, user.getAddress());
           	s.setString(3, user.getCity());
            	s.setString(4, user.getZip());
            	s.setString(5, user.getEmail());
            	s.setString(6, user.getPhone());
            	s.setString(7, user.getPassword());
            	s.setInt(8, user.getId());
            
            	s.executeUpdate();
            	set = true;
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	 
    	return set;
    }
}
