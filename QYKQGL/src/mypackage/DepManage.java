package mypackage;

//import java.sql.ResultSet;
//import java.util.ArrayList;


public class DepManage {

   	public boolean add(String depname,String depscale,String depkeeper,String depaddtime){
		String sql="insert into department(dep_name,dep_scale,dep_keeper,dep_addtime)values('"+depname+"','"+depscale+"','"+depkeeper+"','"+depaddtime+"')";
		DB db=new DB();
		boolean result = false;
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("增加部门信息错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;	
	}
    
    public boolean delete(String depname){
		DB db=new DB();
		boolean result = false;
		try {
			String sql="delete from department where dep_name='"+depname+"'";
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}			
		}catch (Exception e) {
			System.err.println("删除部门信息失败，错误信息："+e.getMessage());
		}
		db.close();
		return result;
	}
	
    public boolean update(String depname,String newdepname,String newdepscale,String newdepkeeper){
		DB db=new DB();
		boolean result = false;
		String sql="update department set dep_name='"+newdepname+"',dep_scale='"+newdepscale+"',dep_keeper='"+newdepkeeper+"' where dep_name='"+depname+"';";
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("部门信息更新错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;
	} 
}