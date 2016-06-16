package mypackage;

//import java.sql.ResultSet;
//import java.util.ArrayList;


public class EmpManage {

   	public boolean add(String empid,String empname,String empsex,String empdep,String emptype,String emppass,String empstatus,String emppolitics,String empjiguan,String empnation,String empmarriage,String empposition,String empidentityid,String empeducation,String empforeign,String emplever,String emptel,String empemail,String empaddress,String empaddtime){
		String sql="insert into employee(emp_id,emp_name,emp_sex,emp_dep,emp_type,emp_pass,emp_status,emp_politics,emp_jiguan,emp_nation,emp_marriage,emp_position,emp_identityid,emp_education,emp_foreign,emp_lever,emp_tel,emp_email,emp_address,emp_photo)values('"+empid+"','"+empname+"','"+empsex+"','"+empdep+"','"+emptype+"','"+emppass+"','"+empstatus+"','"+emppolitics+"','"+empjiguan+"','"+empnation+"','"+empmarriage+"','"+empposition+"','"+empidentityid+"','"+empeducation+"','"+empforeign+"','"+emplever+"','"+emptel+"','"+empemail+"','"+empaddress+"','"+empaddtime+"');";
		DB db=new DB();
		boolean result = false;
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("增加员工信息错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;	
	}
    
    public boolean delete(String empid){
		DB db=new DB();
		boolean result = false;
		try {
			String sql="delete from employee where emp_id='"+empid+"'";
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}			
		}catch (Exception e) {
			System.err.println("删除员工信息失败，错误信息："+e.getMessage());
		}
		db.close();
		return result;
	}
    
    public boolean update(String empid,String newempid,String newempname,String newempsex,String newempdep,String newemptype,String newemppass,String newempstatus,String newemppolitics,String newempjiguan,String newempnation,String newempmarriage,String newempposition,String newempidentityid,String newempeducation,String newempforeign,String newemplever,String newemptel,String newempemail,String newempaddress,String newempaddtime){
		DB db=new DB();
		boolean result = false;
		String sql="update employee set emp_id='"+newempid+"',emp_name='"+newempname+"',emp_sex='"+newempsex+"',emp_dep='"+newempdep+"',emp_type='"+newemptype+"',emp_pass='"+newemppass+"',emp_status='"+newempstatus+"',emp_politics='"+newemppolitics+"',emp_jiguan='"+newempjiguan+"',emp_nation='"+newempnation+"',emp_marriage='"+newempmarriage+"'emp_position='"+newempposition+"',emp_identityid='"+newempidentityid+"',emp_education='"+newempeducation+"',emp_foreign='"+newempforeign+"',emp_lever='"+newemplever+"',emp_tel='"+newemptel+"',emp_email='"+newempemail+"',emp_address='"+newempaddress+"',emp_photo='"+newempaddtime+"' where emp_id='"+empid+"';";
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("员工信息更新错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;
	} 
}