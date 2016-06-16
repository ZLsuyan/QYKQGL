package mypackage;

//import java.sql.ResultSet;

//import java.sql.ResultSet;

public class CheckManage {

   	public boolean add(String empid,String checkbegintime,String checkendtime){
   		DB db=new DB();
   		String sql="insert into checkkq(emp_id,check_begintime,check_endtime)values('"+empid+"','"+checkbegintime+"','"+checkendtime+"');";
   		boolean result = false;
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("¿¼ÇÚÐÅÏ¢²¹Â¼´íÎó£¬´íÎóÐÅÏ¢£º"+e.getMessage());
		}
		db.close();
		return result;	
	}
    
    public boolean delete(String checkid){
		DB db=new DB();
		boolean result = false;
		try {
			String sql="delete from checkkq where check_id='"+checkid+"'";
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}			
		}catch (Exception e) {
			System.err.println("É¾³ý¿¼ÇÚ¼ÇÂ¼Ê§°Ü£¬´íÎóÐÅÏ¢£º"+e.getMessage());
		}
		db.close();
		return result;
	}
    
    public boolean update(String checkid,String newempid,String newcheckbegintime,String newcheckendtime){
		DB db=new DB();
		boolean result = false;
		String sql="update checkkq set emp_id='"+newempid+"',check_begintime='"+newcheckbegintime+"',check_endtime='"+newcheckendtime+"' where check_id='"+checkid+"';";
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("¿¼ÇÚÐÅÏ¢¸üÐÂ´íÎó£¬´íÎóÐÅÏ¢£º"+e.getMessage());
		}
		db.close();
		return result;
	}
}