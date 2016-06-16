package mypackage;

import java.sql.ResultSet;

//import java.sql.ResultSet;
//import java.util.ArrayList;


public class ChucManage {

   	public boolean add(String empid,String chucbegindate,String chucenddate,String chucplace,String chuccontent){
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
   		
   		String sql2="insert into chuchai(emp_id,emp_name,chuc_begindate,chuc_enddate,chuc_place,chuc_content)values('"+empid+"','"+empname+"','"+chucbegindate+"','"+chucenddate+"','"+chucplace+"','"+chuccontent+"')";
		boolean result = false;
		try {
			if(db.executeUpdate(sql2)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("发布出差通知错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;	
	}
    
    public boolean delete(String chucid){
		DB db=new DB();
		boolean result = false;
		try {
			String sql="delete from chuchai where chuc_id='"+chucid+"'";
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}			
		}catch (Exception e) {
			System.err.println("删除出差记录失败，错误信息："+e.getMessage());
		}
		db.close();
		return result;
	}
	
    public boolean update(String chucid,String newempid,String newchucbegindate,String newchucenddate,String newchucplace,String newchuccontent){
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
		String sql2="update chuchai set emp_id='"+newempid+"',emp_name='"+newempname+"',chuc_begindate='"+newchucbegindate+"',chuc_enddate='"+newchucenddate+"',chuc_place='"+newchucplace+"',chuc_content='"+newchuccontent+"' where chuc_id='"+chucid+"';";
		try {
			if(db.executeUpdate(sql2)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("出差信息更新错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;
	} 
}