<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>����֪ͨ�޸�</title>
  </head>
  
  <body>
    <% 
 	request.setCharacterEncoding("gb2312");
 	String submit=request.getParameter("submit");
 	if(submit!=null&!submit.equals(""))
 	{
    	String chucid=request.getParameter("chucid");
    	String newempid=request.getParameter("newempid");
    	String newchucbegindate=request.getParameter("newchucbegindate");
    	String newchucenddate=request.getParameter("newchucenddate");
    	String newchucplace=request.getParameter("newchucplace");
    	String newchuccontent=request.getParameter("newchuccontent");
   	 	ChucManage cm = new ChucManage();
   		if(cm.update(chucid,newempid,newchucbegindate,newchucenddate,newchucplace,newchuccontent))
    	{
    		out.println("<script language='javascript'>alert('�����¼�޸ĳɹ���');</script>");
			response.setHeader("refresh","0;url=chucmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('�����¼�޸�ʧ�ܣ�');</script>");
			response.setHeader("refresh","0;url=chucmanage.jsp");
		}
    }
    %>
  </body>
</html>
