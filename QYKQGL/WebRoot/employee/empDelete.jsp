<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>ɾ��Ա����Ϣ</title> 
  </head>
  
  <body>
  <% 
    request.setCharacterEncoding("gb2312");
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String empid=DateFormate.toGb((String)request.getParameter("empid"));
    if("del".equals(op)){
    	EmpManage em = new EmpManage();
    	if(em.delete(empid)){
    		out.println("<script language='javascript'>alert('��ϲ������¼ɾ���ɹ���');</script>");
			response.setHeader("refresh","0;url=empmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,��¼ɾ��ʧ�ܣ�');</script>");
			response.setHeader("refresh","0;url=empmanage.jsp");
    	}
    }
  %>
  </body>
</html>
