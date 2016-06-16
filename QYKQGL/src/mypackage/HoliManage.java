package mypackage;

import java.sql.ResultSet;

//import java.sql.ResultSet;
//import java.util.ArrayList;


public class HoliManage {

   	public boolean add(String empid,String holibegindate,String holienddate,String holireason){
   		String empname="";
   		DB db=new DB();
   		String sql="select emp_name from employee where emp_id='"+empid+"';";
   		try
		{
			ResultSet rs=db.executeQuery(sql);
			if(rs.next()){
				empname = rs.getString(1);
			}
			rs.close();
		}
		catch(Exception e){
		}
   		
   		String sql2="insert into holidays(emp_id,emp_name,holi_begindate,holi_enddate,holi_reason)values('"+empid+"','"+empname+"','"+holibegindate+"','"+holienddate+"','"+holireason+"')";
		boolean result = false;
		try {
			if(db.executeUpdate(sql2)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("·¢²¼Çë¼ÙÐÅÏ¢´íÎó£¬´íÎóÐÅÏ¢£º"+e.getMessage());
		}
		db.close();
		return result;	
	}
    
    public boolean delete(String holiid){
		DB db=new DB();
		boolean result = false;
		try {
			String sql="delete from holidays where holi_id='"+holiid+"'";
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}			
		}catch (Exception e) {
			System.err.println("É¾³ýÇë¼Ù¼ÇÂ¼Ê§°Ü£¬´íÎóÐÅÏ¢£º"+e.getMessage());
		}
		db.close();
		return result;
	}
	
    public boolean update(String holiid,String newempid,String newholibegindate,String newholienddate,String newholireason){
    	String newempname="";
   		DB db=new DB();
   		String sql="select emp_name from employee where emp_id='"+newempid+"';";
   		try
		{
			ResultSet rs=db.executeQuery(sql);
			if(rs.next()){
				newempname = rs.getString(1);
			}
			rs.close();
		}
		catch(Exception e){
		}

		boolean result = false;
		String sql2="update holidays set emp_id='"+newempid+"',emp_name='"+newempname+"',holi_begindate='"+newholibegindate+"',holi_enddate='"+newholienddate+"',holi_reason='"+newholireason+"' where holi_id='"+holiid+"';";
		try {
			if(db.executeUpdate(sql2)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("³ö²îÐÅÏ¢¸üÐÂ´íÎó£¬´íÎóÐÅÏ¢£º"+e.getMessage());
		}
		db.close();
		return result;
	}
}