<%@ page language="java" isErrorPage="true" import="java.util.*" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>error page</title>
  </head>
  
  <body>
  <br>页面发生错误，错误信息为:  <%=exception.getMessage()%><br>
     详细信息为：<pre>
  <%
  java.io.CharArrayWriter cw = new java.io.CharArrayWriter();
  java.io.PrintWriter pw = new java.io.PrintWriter(cw,true);
  exception.printStackTrace(pw);
  out.println(cw.toString());
  %>
  </pre>
  </body>
</html>
