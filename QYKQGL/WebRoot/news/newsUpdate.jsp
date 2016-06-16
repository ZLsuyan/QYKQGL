<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>公告信息修改</title>
  </head>
  
  <body>
    <% 
 	request.setCharacterEncoding("gb2312");
 	String submit=request.getParameter("submit");
 	if(submit!=null&!submit.equals(""))
 	{
    	String newsid=request.getParameter("newsid");
    	String newnewstitle=request.getParameter("newnewstitle");
    	String newnewscontent=request.getParameter("newnewscontent");
    	String newnewsobject=request.getParameter("newnewsobject");
    	String yesorno=request.getParameter("yesorno");
    	String newnewsaddtime = DateFormate.getDateTime();
    	NewsManage nm = new NewsManage();
    	if(yesorno.equalsIgnoreCase("yes"))
    	{
    		if(nm.update(newsid,newnewstitle,newnewscontent,newnewsobject,newnewsaddtime))
    		{
    			out.println("<script language='javascript'>alert('公告信息修改成功！');</script>");
				response.setHeader("refresh","0;url=newsmanage.jsp");
			}else{
				out.println("<script language='javascript'>alert('公告信息修改失败！');</script>");
				response.setHeader("refresh","0;url=newsmanage.jsp");
			}
		}
		else{
			if(nm.update2(newsid,newnewstitle,newnewscontent,newnewsobject))
    		{
    			out.println("<script language='javascript'>alert('公告信息修改成功！');</script>");
				response.setHeader("refresh","0;url=newsmanage.jsp");
			}else{
				out.println("<script language='javascript'>alert('公告信息修改失败！');</script>");
				response.setHeader("refresh","0;url=newsmanage.jsp");
			}
		}
    }
    %>
  </body>
</html>
