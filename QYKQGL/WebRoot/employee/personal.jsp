<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
	
	<title>���˻�����Ϣ�鿴</title>
    <style type="text/css">
	<!--
	.STYLE1 {
	font-size: 18px;
	font-weight: bold;
	font-face: ����;
	}
	-->
	</style>
  </head>
  
  <body>
  <% 
 	String empid = String.valueOf(session.getAttribute("s_userid"));
    String sql="select * from employee where emp_id='"+empid+"';";
    DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		rs.next();
	%>
    <br>
<table width="800" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#E6E6FA">
  <tr>
    <td height="40" colspan="4" align="center" valign="middle"><strong><font face="����" size="5" color="#9370DB">���˻�����Ϣ�鿴</font></strong></td>
  </tr>
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">Ա�����:</span></td>
        <td width="180" align="left"><input name="empid" type="text" disabled size="20" value="<%= rs.getString(1)%>"></td>
        <td width="120" height="35" align="right"><span class="STYLE1">����:</span></td>
        <td width="180" align="left"><input name="empname" type="text" disabled size="20" value="<%= rs.getString(2)%>"></td>
      </tr>
      
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">�Ա�:</span></td>
        <td width="180" align="left"><input name="empsex" type="text" disabled size="20" value="<%= rs.getString(3)%>"></td>
        <td align="right"><span class="STYLE1">��������:</span></td>
        <td width="180" align="left"><input name="empdep" type="text" disabled size="20" value="<%= rs.getString(4)%>"></td>
      </tr>
      
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">Ա����ɫ:</span></td>
        <td width="180" align="left"><input name="emptype" type="text" disabled size="20" value="<%= rs.getString(5)%>"></td>
        <td width="120" height="35" align="right"><span class="STYLE1">����:</span></td>
        <td width="180" align="left"><input name="emppass" type="text" disabled size="20" value="<%= rs.getString(6)%>"></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"> <span class="STYLE1">��ְ���: </span></td>
        <td width="180" align="left"><input name="empstatus" type="text" disabled size="20" value="<%= rs.getString(7)%>"></td>
        <td height="35" align="right"> <span class="STYLE1">������ò:</span></td>
        <td width="180" align="left"><input name="emppolitics" type="text" disabled size="20" value="<%= rs.getString(8)%>"></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">����:</span></td>
        <td><input name="empjiguan" type="text" disabled size="20" value="<%= rs.getString(9)%>"></td>
        <td align="right"><span class="STYLE1">����:</span></td>
        <td><input name="empnation" type="text" disabled size="20" value="<%= rs.getString(10)%>"></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">����״��:</span></td>
        <td width="180" align="left"><input name="empmarriage" type="text" disabled size="20" value="<%= rs.getString(11)%>"></td>
        <td height="35" align="right"><span class="STYLE1">ְ��:</span></td>
        <td><input name="empposition" type="text" disabled size="20" value="<%= rs.getString(12)%>"></td>
      </tr>
     
      <tr>
        <td height="35" align="right"><span class="STYLE1">���֤��:</span></td>
        <td><input name="empidentityid" type="text" class="data" disabled size="20" value="<%= rs.getString(13)%>"></td>
        <td height="35" align="right"><span class="STYLE1">ѧ��:</span></td>
        <td width="180" align="left"><input name="empeducation" type="text" disabled size="20" value="<%= rs.getString(14)%>"></td>
      </tr>
      
      <tr>
        <td height="35" align="right"> <span class="STYLE1">��������:</span></td>
        <td width="180" align="left"><input name="empforeign" type="text" disabled size="20" value="<%= rs.getString(15)%>"></td>
        <td align="right"><span class="STYLE1">����ˮƽ:</span></td>
        <td width="180" align="left"><input name="emplever" type="text" disabled size="20" value="<%= rs.getString(16)%>"></td>
      </tr>
      
      <tr>
        <td height="35" align="right"><span class="STYLE1">��ϵ�绰:</span></td>
        <td width="180" align="left"><input name="emptel" type="text" disabled size="20" value="<%= rs.getString(17)%>"></td>
        <td align="right"><span class="STYLE1">����:</span></td>
        <td width="180" align="left"><input name="empemail" type="text" disabled size="20" value="<%= rs.getString(18)%>"></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">��ͥסַ:</span></td>
        <td width="180" align="left"><input name="empaddress" type="text" disabled size="20" value="<%= rs.getString(19)%>"></td>
        <td align="center" align="right" valign="middle"><span class="STYLE1">��ְʱ��:</span></td>
    	<td width="180" align="left"><input name="empaddtime" type="text" disabled size="20" value="<%= rs.getString(20)%>"></td>
      </tr>
      
      <tr>
        <td height="40" colspan="4" align="center">
          <input type="button" value="����" onclick="javascript:history.back();">
        </td>
      </tr>
	</table>
	<%
	rs.close();
	}catch(Exception e){
		System.out.println("Ա����Ϣ�޸Ĵ��󣬴�����Ϣ��"+e.getMessage());
	}
	db.close();
  %> 	
  </body>
</html>
