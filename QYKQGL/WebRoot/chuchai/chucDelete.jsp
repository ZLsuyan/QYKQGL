<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>É¾³ý³ö²î¼ÇÂ¼</title> 
  </head>
  
  <body>
  <% 
    request.setCharacterEncoding("gb2312");
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String chucid=DateFormate.toGb((String)request.getParameter("chucid"));
    if("del".equals(op)){
    	ChucManage cm = new ChucManage();
    	if(cm.delete(chucid)){
    		out.println("<script language='javascript'>alert('¹§Ï²Äú£¬¼ÇÂ¼É¾³ý³É¹¦£¡');</script>");
			response.setHeader("refresh","0;url=chucmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,¼ÇÂ¼É¾³ýÊ§°Ü£¡');</script>");
			response.setHeader("refresh","0;url=chucmanage.jsp");
    	}
    }
  %>
  </body>
</html>
