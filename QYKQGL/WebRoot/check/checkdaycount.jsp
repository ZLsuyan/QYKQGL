<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*,java.text.SimpleDateFormat,java.text.DateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>日终统计</title>
<style type="text/css">
<!--
.STYLE1{
	font-size: 22px;
	font-family: 楷体;
	font-weight: bold;
}
.STYLE2 {
	font-size: 20px;
	font-family: 楷体;
}
-->
</style>
<% 
	request.setCharacterEncoding("gb2312");
	String nowdate = DateFormate.getDate();
	
	DB db = new DB();
	String sqlexist = "select count(*) from daycount where dayc_date='"+nowdate+"';";
	try{
		ResultSet rsexist = db.executeQuery(sqlexist);
		if(rsexist.next()){
			int checkexistcount = rsexist.getInt(1);
			rsexist.close();
			if(checkexistcount>0){
				out.println("<script language='javascript'>alert('今天的考勤信息已统计！');</script>");
				response.setHeader("refresh","0;url=../check/checkmanage.jsp");
			}else{
				DaycountManage dm = new DaycountManage();
				String sql="select count(emp_id) from checkkq where check_begintime like '"+nowdate+"%';";
				try{
					ResultSet rs = db.executeQuery(sql);
					if(rs.next()){
						int checkcount = rs.getInt(1);
						rs.close();
						if(checkcount>0){
							String sql2="select emp_id,check_begintime,check_endtime from checkkq where check_begintime like '"+nowdate+"%' order by emp_id;";
							try{
								ResultSet rs2 = db.executeQuery(sql2);
								String[] check_empid=new String[30000];
								String[] check_checkbegintime=new String[30000];
								String[] check_checkendtime=new String[30000];
								for(int i=1;i<=checkcount;i++){
									rs2.next();
									check_empid[i] = rs2.getString(1);
									check_checkbegintime[i] = rs2.getString(2);
									check_checkendtime[i] = rs2.getString(3);
			
						
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									java.util.Date check_begintime = sdf.parse(check_checkbegintime[i]);
									java.util.Date check_endtime = sdf.parse(check_checkendtime[i]);
									SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
									String begintime = sdf2.format(check_begintime);
									String endtime = sdf2.format(check_endtime);
						
									//out.println("<script language='javascript'>alert('"+begintime+"');</script>");
									//out.println("<script language='javascript'>alert('"+endtime+"');</script>");
						
									int a = begintime.compareTo("08:40:00");
									int b = endtime.compareTo("17:50:00");
									int c = endtime.compareTo("18:50:00");
									if(a>0){								//迟到
										if(dm.addlate(check_empid[i],nowdate)){
											out.println("<script language='javascript'>alert('迟到记录添加成功！');</script>");
										}else{
											out.println("<script language='javascript'>alert('Sorry,迟到记录添加失败！');</script>");
										}
									}
									if(b<0){								//早退
										if(dm.addearly(check_empid[i],nowdate)){
											out.println("<script language='javascript'>alert('早退记录添加成功！');</script>");
										}else{
											out.println("<script language='javascript'>alert('Sorry,早退记录添加失败！');</script>");
										}
									}
									if(a<=0&b>=0&c<0){						//正常
										if(dm.addnormal(check_empid[i],nowdate)){
											out.println("<script language='javascript'>alert('正常记录添加成功！');</script>");
										}else{
											out.println("<script language='javascript'>alert('Sorry,正常记录添加失败！');</script>");
										}
									}
									if(c>=0){								//加班
										if(dm.addovertime(check_empid[i],nowdate)){
											out.println("<script language='javascript'>alert('加班记录添加成功！');</script>");
										}else{
											out.println("<script language='javascript'>alert('Sorry,加班记录添加失败！');</script>");
										}
									}
								}
								rs2.close();
							}catch(Exception e){
							}
						}
					}
				}catch(Exception e){
				}
	
				String sql3="select count(emp_id) from chuchai where '"+nowdate+"' between chuc_begindate and chuc_enddate;";
				try{
					ResultSet rs3 = db.executeQuery(sql3);
					if(rs3.next()){
						int chuccount = rs3.getInt(1);
						rs3.close();
						if(chuccount>0){
							String sql4="select emp_id,emp_name from chuchai where '"+nowdate+"' between chuc_begindate and chuc_enddate order by emp_id;";
							try{
								ResultSet rs4 = db.executeQuery(sql4);
								String[] chuc_empid=new String[30];
								String[] chuc_empname=new String[30];
								for(int i=1;i<=chuccount;i++){
									rs4.next();
									chuc_empid[i] = rs4.getString(1);
									chuc_empname[i] = rs4.getString(2);
									if(dm.addchuc(chuc_empid[i],chuc_empname[i],nowdate)){
										out.println("<script language='javascript'>alert('出差记录添加成功！');</script>");
									}else{
										out.println("<script language='javascript'>alert('Sorry,出差记录添加失败！');</script>");
									}
								}
								rs4.close();
							}catch(Exception e){
							}
						}
					}
				}catch(Exception e){
				}
	
				String sql5="select count(emp_id) from holidays where '"+nowdate+"' between holi_begindate and holi_enddate;";
				try{
					ResultSet rs5 = db.executeQuery(sql5);
					if(rs5.next()){
						int holicount = rs5.getInt(1);
						rs5.close();
						if(holicount>0){
							String sql6="select emp_id,emp_name from holidays where '"+nowdate+"' between holi_begindate and holi_enddate order by emp_id;";
							try{
								ResultSet rs6 = db.executeQuery(sql6);
								String[] holi_empid=new String[30];
								String[] holi_empname=new String[30];
								for(int i=1;i<=holicount;i++){
									rs6.next();
									holi_empid[i] = rs6.getString(1);
									holi_empname[i] = rs6.getString(2);
									if(dm.addholi(holi_empid[i],holi_empname[i],nowdate)){
										out.println("<script language='javascript'>alert('请假记录添加成功！');</script>");
									}else{
										out.println("<script language='javascript'>alert('Sorry,请假记录添加失败！');</script>");
									}
								}
								rs6.close();
							}catch(Exception e){
							}
						}
					}
				}catch(Exception e){
				}
	
	
				String sql7="select count(emp_id) from employee;";
				try{
					ResultSet rs7 = db.executeQuery(sql7);
					int empcount = 0;
					if(rs7.next()){
						empcount = rs7.getInt(1);
					}
					if(empcount>0){
						String sql8 = "select emp_id from employee;";
						try{
							ResultSet rs8 = db.executeQuery(sql8);
							String d_empid[] = new String[30];
							for(int i=0;i<empcount;i++){
								rs8.next();
								d_empid[i] = rs8.getString(1);
							}
							rs8.close();
							for(int i=0;i<empcount;i++){
								String sql9="select count(emp_id) from daycount where dayc_date='"+nowdate+"' and emp_id='"+d_empid[i]+"';";
								try{
									ResultSet rs9 = db.executeQuery(sql9);
									int empidcount = 0;
									if(rs9.next()){
										empidcount = rs9.getInt(1);
									}
									rs9.close();
									if(empidcount==0){
										if(dm.addabsence(d_empid[i],nowdate)){
											out.println("<script language='javascript'>alert('旷工记录添加成功！');</script>");
										}else{
											out.println("<script language='javascript'>alert('Sorry,旷工记录添加失败！');</script>");
										}
									}
								}catch(Exception e){
								}
							}
						}catch(Exception e){
						} 
					}
				}catch(Exception e){
				}
			}
		}
	}catch(Exception e){
	}
	db.close();
%>
</head>

<body>
</body>
</html>
