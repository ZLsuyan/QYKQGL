<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>É¾³ý¿¼ÇÚ¼ÇÂ¼</title> 
  </head>
  
  <body>
  <% 
    request.setCharacterEncoding("gb2312");
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String checkid=DateFormate.toGb((String)request.getParameter("checkid"));
    if("del".equals(op)){
    	CheckManage cm = new CheckManage();
    	if(cm.delete(checkid)){
    		out.println("<script language='javascript'>alert('¹§Ï²Äú£¬¼ÇÂ¼É¾³ý³É¹¦£¡');</script>");
			response.setHeader("refresh","0;url=checkmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,¼ÇÂ¼É¾³ýÊ§°Ü£¡');</script>");
			response.setHeader("refresh","0;url=checkmanage.jsp");
    	}
    }
  %>
  </body>
</html>
