<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>公告内容</title>
	<style type="text/css">
	<!--
	.STYLE1 {
	font-size: 27px;
	font-weight: bold;
	}
	.STYLE2 {
	font-size: 24px;
	font-family: 楷体;
	}
	-->
	</style>
	<%
	request.setCharacterEncoding("gb2312");
	String newsid=request.getParameter("newsid");
	String sql="select news_title,news_content,news_object,news_addtime from news where news_id='"+newsid+"';";
	DB db = new DB();
	String newstitle="";
	String newscontent="";
	String newsobject="";
	String newsaddtime="";
	try{
		ResultSet rs = db.executeQuery(sql);
		if(rs.next()){
			newstitle = rs.getString(1);
			newscontent = rs.getString(2);
			newsobject = rs.getString(3);
			newsaddtime = rs.getString(4);
			rs.close();
		}
	}catch(Exception e){
	}
	db.close();
%>
  </head>
  
  <body>
  <br><br>
  <table align = "center" width="80%" border="0" cellpadding="0" cellspacing="1" background="../img/intro_bg.jpg">
    <tr>
    	<td colspan="2" height="50" align="center" valign="middle"><span class="STYLE1"><font face="楷体">标题：<%=newstitle %></font></span></td>
  	</tr>
  
  	<tr>
    	<td colspan="2" height="70" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=newscontent %></font></span></td>
    </tr>
  
 	<tr>
   	 	<td width="20%" height="40" align="right" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体">发布对象：</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=newsobject %></font></span></td>
  	</tr>
  	
  	<tr>
   	 	<td width="30%" height="40" align="right" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体">发布时间：</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=newsaddtime %></font></span></td>
  	</tr>
  	
  	<tr>
        <td height="40" colspan="2" align="center">
          <input type="button" value="返回" onclick="javascript:history.back();">
        </td>
      </tr>
   </table>
  </body>
</html>
