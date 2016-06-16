package mypackage;

import java.sql.ResultSet;

//import java.sql.ResultSet;

public class DaycountManage {
	
	 public boolean delete(String daycdate){
			DB db=new DB();
			boolean result = false;
			try {
				String sql="delete from daycount where dayc_date='"+daycdate+"'";
				if(db.executeUpdate(sql)==1){
					result = true;
				}else{
					result = false;
				}			
			}catch (Exception e) {
				System.err.println("删除考勤统计记录失败，错误信息："+e.getMessage());
			}
			db.close();
			return result;
		}
	
	 
	public boolean addabsence(String empid,String daycdate){
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
		
   		String sql2="insert into daycount(emp_id,emp_name,dayc_date,dayc_absence)values('"+empid+"','"+empname+"','"+daycdate+"','1');";
   		boolean result = false;
		try {
			if(db.executeUpdate(sql2)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("旷工记录插入错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;	
	}
	
	
	
	
	public boolean addlate(String empid,String daycdate){
		DB db=new DB();
   		boolean result = false;
		String sql="select count(*) from daycount where emp_id='"+empid+"' and dayc_date='"+daycdate+"';";
   		int count=0;
   		try
		{
			ResultSet rs=db.executeQuery(sql);
			if(rs.next()){
				count = rs.getInt(1);
			}
			rs.close();
		}
		catch(Exception e){
		}
		if(count>0){
			String sql2="update daycount set dayc_late='1' where emp_id='"+empid+"' and dayc_date='"+daycdate+"';";
			try {
				if(db.executeUpdate(sql2)==1){
					result = true;
				}else{
					result = false;
				}
			}catch (Exception e) {
			}
			return result;
		}else{
			String empname="";
			String sql3="select emp_name from employee where emp_id='"+empid+"';";
			try
			{
				ResultSet rs2=db.executeQuery(sql3);
				if(rs2.next()){
					empname = rs2.getString(1);
				}
				rs2.close();
			}
			catch(Exception e){
			}
		
			String sql4="insert into daycount(emp_id,emp_name,dayc_date,dayc_late)values('"+empid+"','"+empname+"','"+daycdate+"','1');";
			try {
				if(db.executeUpdate(sql4)==1){
					result = true;
				}else{
					result = false;
				}
			}catch (Exception e) {
				System.err.println("迟到记录插入错误，错误信息："+e.getMessage());
			}
			db.close();
			return result;	
		}
	}

	
	
	
	public boolean addearly(String empid,String daycdate){
   		DB db=new DB();
   		boolean result = false;
   		String sql="select count(*) from daycount where emp_id='"+empid+"' and dayc_date='"+daycdate+"';";
   		int count=0;
   		try
		{
			ResultSet rs=db.executeQuery(sql);
			if(rs.next()){
				count = rs.getInt(1);
			}
			rs.close();
		}
		catch(Exception e){
		}
		if(count>0){
			String sql2="update daycount set dayc_early='1' where emp_id='"+empid+"' and dayc_date='"+daycdate+"';";
			try {
				if(db.executeUpdate(sql2)==1){
					result = true;
				}else{
					result = false;
				}
			}catch (Exception e) {
				System.err.println("早退记录插入错误，错误信息："+e.getMessage());
			}
		}else{
			String empname="";
			String sql3="select emp_name from employee where emp_id='"+empid+"';";
			try
			{
				ResultSet rs2=db.executeQuery(sql3);
				if(rs2.next()){
				empname = rs2.getString(1);
				}
				rs2.close();
			}
			catch(Exception e){
			}
		
			String sql4="insert into daycount(emp_id,emp_name,dayc_date,dayc_early)values('"+empid+"','"+empname+"','"+daycdate+"','1');";
			try {
				if(db.executeUpdate(sql4)==1){
					result = true;
				}else{
					result = false;
				}
			}catch (Exception e) {
				System.err.println("早退记录插入错误，错误信息："+e.getMessage());
			}
		}
		
		db.close();
		return result;	
	}
	
	
	public boolean addnormal(String empid,String daycdate){
		DB db=new DB();
   		boolean result = false;
   		String sql="select count(*) from daycount where emp_id='"+empid+"' and dayc_date='"+daycdate+"';";
   		int count=0;
   		try
		{
			ResultSet rs=db.executeQuery(sql);
			if(rs.next()){
				count = rs.getInt(1);
			}
			rs.close();
		}
		catch(Exception e){
		}
		if(count>0){
			String sql2="update daycount set dayc_normal='1' where emp_id='"+empid+"' and dayc_date='"+daycdate+"';";
			try {
				if(db.executeUpdate(sql2)==1){
					result = true;
				}else{
					result = false;
				}
			}catch (Exception e) {
				System.err.println("正常记录插入错误，错误信息："+e.getMessage());
			}
		}else{
			String empname="";
			String sql3="select emp_name from employee where emp_id='"+empid+"';";
			try
			{
				ResultSet rs2=db.executeQuery(sql3);
				if(rs2.next()){
				empname = rs2.getString(1);
				}
				rs2.close();
			}
			catch(Exception e){
			}
		
			String sql4="insert into daycount(emp_id,emp_name,dayc_date,dayc_normal)values('"+empid+"','"+empname+"','"+daycdate+"','1');";
			try {
				if(db.executeUpdate(sql4)==1){
					result = true;
				}else{
					result = false;
				}
			}catch (Exception e) {
				System.err.println("正常记录插入错误，错误信息："+e.getMessage());
			}
		}
		
		db.close();
		return result;	
	}		
	
	
	public boolean addovertime(String empid,String daycdate){
		DB db=new DB();
   		boolean result = false;
   		String sql="select count(*) from daycount where emp_id='"+empid+"' and dayc_date='"+daycdate+"';";
   		int count=0;
   		try
		{
			ResultSet rs=db.executeQuery(sql);
			if(rs.next()){
				count = rs.getInt(1);
			}
			rs.close();
		}
		catch(Exception e){
		}
		if(count>0){
			String sql2="update daycount set dayc_overtime='1' where emp_id='"+empid+"' and dayc_date='"+daycdate+"';";
			try {
				if(db.executeUpdate(sql2)==1){
					result = true;
				}else{
					result = false;
				}
			}catch (Exception e) {
				System.err.println("加班记录插入错误，错误信息："+e.getMessage());
			}
		}else{
			String empname="";
			String sql3="select emp_name from employee where emp_id='"+empid+"';";
			try
			{
				ResultSet rs2=db.executeQuery(sql3);
				if(rs2.next()){
				empname = rs2.getString(1);
				}
				rs2.close();
			}
			catch(Exception e){
			}
		
			String sql4="insert into daycount(emp_id,emp_name,dayc_date,dayc_overtime)values('"+empid+"','"+empname+"','"+daycdate+"','1');";
			try {
				if(db.executeUpdate(sql4)==1){
					result = true;
				}else{
					result = false;
				}
			}catch (Exception e) {
				System.err.println("加班记录插入错误，错误信息："+e.getMessage());
			}
		}
		
		db.close();
		return result;	
	}
	
	
	
	
	public boolean addchuc(String empid,String empname,String daycdate){
   		DB db=new DB();
   		String sql="insert into daycount(emp_id,emp_name,dayc_date,dayc_chuc)values('"+empid+"','"+empname+"','"+daycdate+"','1');";
   		boolean result = false;
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("出差记录插入错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;	
	}
	
	
	public boolean addholi(String empid,String empname,String daycdate){
   		DB db=new DB();
   		String sql="insert into daycount(emp_id,emp_name,dayc_date,dayc_holi)values('"+empid+"','"+empname+"','"+daycdate+"','1');";
   		boolean result = false;
		try {
			if(db.executeUpdate(sql)==1){
				result = true;
			}else{
				result = false;
			}
		}catch (Exception e) {
			System.err.println("请假记录插入错误，错误信息："+e.getMessage());
		}
		db.close();
		return result;	
	}
}