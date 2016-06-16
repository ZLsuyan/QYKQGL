<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>员工信息修改完成</title>
  </head>
  
  <body>
    <% 
 	request.setCharacterEncoding("gb2312");
 	String submit=request.getParameter("submit");
 	if(submit!=null&!submit.equals(""))
 	{
    	String empid=request.getParameter("empid");
    	String newempid=request.getParameter("newsempid");
		String newempname=request.getParameter("newempname");
		String newempsex=request.getParameter("newempsex");
		String newempdep=request.getParameter("newempdep");
		String newemptype=request.getParameter("newemptype");
		String newemppass=request.getParameter("newemppass");
		String newempstatus=request.getParameter("newempstatus");
		String newemppolitics=request.getParameter("newemppolitics");
		String newempjiguan=request.getParameter("newempjiguan");
		String newempnation=request.getParameter("newempnation");
		String newempmarriage=request.getParameter("newempmarriage");
		String newempposition=request.getParameter("newempposition");
		String newempidentityid=request.getParameter("newempidentityid");
		String newempeducation=request.getParameter("newempeducation");
		String newempforeign=request.getParameter("newempforeign");
		String newemplever=request.getParameter("newemplever");
		String newemptel=request.getParameter("newemptel");
		String newempemail=request.getParameter("newempemail");
		String newempaddress=request.getParameter("newempaddress");
		String newempaddtime=request.getParameter("newempaddtime");
   	 	EmpManage em = new EmpManage();
   		if(em.update(empid,newempid,newempname,newempsex,newempdep,newemptype,newemppass,newempstatus,newemppolitics,newempjiguan,newempnation,newempmarriage,newempposition,newempidentityid,newempeducation,newempforeign,newemplever,newemptel,newempemail,newempaddress,newempaddtime))
    	{
    		out.println("<script language='javascript'>alert('员工信息修改成功！');</script>");
			response.setHeader("refresh","0;url=empmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('员工信息修改失败！');</script>");
			response.setHeader("refresh","0;url=empmanage.jsp");
		}
    }
    %>
  </body>
</html>
