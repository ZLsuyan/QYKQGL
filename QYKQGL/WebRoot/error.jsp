<%@ page language="java" isErrorPage="true" import="java.util.*" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>error page</title>
  </head>
  
  <body>
  <br>ҳ�淢�����󣬴�����ϢΪ:  <%=exception.getMessage()%><br>
     ��ϸ��ϢΪ��<pre>
  <%
  java.io.CharArrayWriter cw = new java.io.CharArrayWriter();
  java.io.PrintWriter pw = new java.io.PrintWriter(cw,true);
  exception.printStackTrace(pw);
  out.println(cw.toString());
  %>
  </pre>
  </body>
</html>
