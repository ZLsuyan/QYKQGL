<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>删除部门信息</title> 
  </head>
  
  <body>
  <% 
    request.setCharacterEncoding("gb2312");
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String depname=DateFormate.toGb((String)request.getParameter("depname"));
    if("del".equals(op)){
    	DepManage dm = new DepManage();
    	if(dm.delete(depname)){
    		out.println("<script language='javascript'>alert('恭喜您，记录删除成功！');</script>");
			response.setHeader("refresh","0;url=depmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,记录删除失败！');</script>");
			response.setHeader("refresh","0;url=depmanage.jsp");
    	}
    }
  %>
  </body>
</html>
