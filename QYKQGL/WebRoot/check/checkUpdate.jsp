<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>¿¼ÇÚ¼ÇÂ¼ÐÞ¸Ä</title>
  </head>
  
  <body>
    <% 
 	request.setCharacterEncoding("gb2312");
 	String submit=request.getParameter("submit");
 	if(submit!=null&!submit.equals(""))
 	{
    	String checkid=request.getParameter("checkid");
    	String newempid=request.getParameter("newempid");
    	String newcheckbegintime=request.getParameter("newcheckbegintime");
    	String newcheckendtime=request.getParameter("newcheckendtime");
    	String nowdate = DateFormate.getDate();
    	CheckManage cm = new CheckManage();
    	DaycountManage dm = new DaycountManage();
   		if(cm.update(checkid,newempid,newcheckbegintime,newcheckendtime))
    	{
    		dm.delete(nowdate);
    		out.println("<script language='javascript'>alert('¿¼ÇÚ¼ÇÂ¼ÐÞ¸Ä³É¹¦£¡');</script>");
			response.setHeader("refresh","0;url=checkmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('¿¼ÇÚ¼ÇÂ¼ÐÞ¸ÄÊ§°Ü£¡');</script>");
			response.setHeader("refresh","0;url=checkmanage.jsp");
		}
    }
    %>
  </body>
</html>
