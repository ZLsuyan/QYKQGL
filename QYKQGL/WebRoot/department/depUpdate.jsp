<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>������Ϣ�޸����</title>
  </head>
  
  <body>
    <% 
 	request.setCharacterEncoding("gb2312");
 	String submit=request.getParameter("submit");
 	if(submit!=null&!submit.equals(""))
 	{
    	String depname=request.getParameter("depname");
    	String newdepname=request.getParameter("newdepname");
    	String newdepscale=request.getParameter("newdepscale");
   	 	String newdepkeeper=request.getParameter("newdepkeeper");
   	 	DepManage dm = new DepManage();
   		if(dm.update(depname,newdepname,newdepscale,newdepkeeper))
    	{
    		out.println("<script language='javascript'>alert('������Ϣ�޸ĳɹ���');</script>");
			response.setHeader("refresh","0;url=depmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('������Ϣ�޸�ʧ�ܣ�');</script>");
			response.setHeader("refresh","0;url=depmanage.jsp");
		}
    }
    %>
  </body>
</html>
