package mypackage;

import java.sql.ResultSet;
 
public class LoginTest {
	public boolean testUserId(String userid)
	{
		String sql="select count(*) from employee where emp_id = '"+userid+"';";
		DB db=new DB();
		boolean result = false;
		try
		{
			ResultSet rs=db.executeQuery(sql);
			if(rs.next()){
				if(rs.getInt(1)>0){
					result=true;
				}else{
				    result=false;
				}
			}else{
				result=false;
			}
		}catch(Exception e){
			
		}
		return result;
	}
	
	
	public String testUser(String userid,String password,String type)
	{
		String sql="select emp_name from employee where emp_id = '"+userid+"' and emp_pass='"+password+"' and emp_type='"+type+"'";
		DB db=new DB();
		String emp_name = "";
		try
		{
			ResultSet rs=db.executeQuery(sql);
			if(rs.next()){
				emp_name = rs.getString(1);
			}
			rs.close();
		}
		catch(Exception e){
			
		}
		db.close();
		return emp_name;
	}
}
