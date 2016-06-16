<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Çë¼Ù¼ÇÂ¼ÐÞ¸Ä</title>
  </head>
  
  <body>
    <% 
 	request.setCharacterEncoding("gb2312");
 	String submit=request.getParameter("submit");
 	if(submit!=null&!submit.equals(""))
 	{
    	String holiid=request.getParameter("holiid");
    	String newempid=request.getParameter("newempid");
    	String newholibegindate=request.getParameter("newholibegindate");
    	String newholienddate=request.getParameter("newholienddate");
    	String newholireason=request.getParameter("newholireason");
    	HoliManage hm = new HoliManage();
   		if(hm.update(holiid,newempid,newholibegindate,newholienddate,newholireason))
    	{
    		out.println("<script language='javascript'>alert('Çë¼Ù¼ÇÂ¼ÐÞ¸Ä³É¹¦£¡');</script>");
			response.setHeader("refresh","0;url=holimanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Çë¼Ù¼ÇÂ¼ÐÞ¸ÄÊ§°Ü£¡');</script>");
			response.setHeader("refresh","0;url=holimanage.jsp");
		}
    }
    %>
  </body>
</html>
