<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*,java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���տ��ڱ���</title>
<style type="text/css">
<!--
.STYLE1{
	font-size: 22px;
	font-family: ����;
	font-weight: bold;
}
.STYLE2 {
	font-size: 20px;
	font-family: ����;
}
-->
</style>
<% 
DB db2 = new DB();
java.util.Date nowdate=new java.util.Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
String str=sdf.format(nowdate);
String nowyear=str.substring(0, 4);
String sql2="select count(emp_id) from employee order by emp_name;";
	try{
		ResultSet rs2 = db2.executeQuery(sql2);
		if(rs2.next()){
			int empcount = rs2.getInt(1);
			rs2.close();
			if(empcount>0){
				session.setAttribute("s_empcount",empcount);
				String sql3="select emp_id,emp_name,emp_dep from employee order by emp_name;";
				try{
					ResultSet rs3 = db2.executeQuery(sql3);
					String[] s_empid=new String[3000];
					String[] s_empname=new String[3000];
					String[] s_empdep=new String[3000];
					for(int i=1;i<=empcount;i++){
						rs3.next();
						s_empid[i] = rs3.getString(1);
						s_empname[i] = rs3.getString(2);
						s_empdep[i] = rs3.getString(3);
					}
					session.setAttribute("s_empid",s_empid);
					session.setAttribute("s_empname",s_empname);
					session.setAttribute("s_empdep",s_empdep);
					rs3.close();
				}catch(Exception e){
				}
			}
		}
	}catch(Exception e){
	}
	db2.close();
	
	%>
</head>

<body>
<form name="yearreportform" action="yearreport.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr style="background-color: #F0FFFF">
  	<td height="40" colspan="11" align="center" valign="middle">
  	<strong><font size="6" face="����" color="#4B0082">���տ��ڱ���</font></strong>&nbsp;&nbsp;&nbsp;
  	<input type="button" value="����" onclick="javascript:history.back();">
  	</td>
  </tr>
  <tr bgcolor="#9EC3F2">
  	<td height="25" colspan="6" align="center" valign="bottom"><font size="5" face="����" color="#9932CC">ͳ����ݣ�</font>
  	<select name="year" size="1">
      <option value="<%= nowyear%>" selected><%= nowyear%></option>
      <%
        for(int i=2016;i<2999;i++){
		%>
			<option value="<%=i %>"> <%=i %></option>
		<%	
		}
        %>
    </select>��
  	</td>
    <td height="25" colspan="5" align="center" valign="bottom"><font size="5" face="����" color="#9932CC">������</font>
      <select name="empidindex" size="1">
      <option value=""></option>
      <%
        int empcount = Integer.parseInt(String.valueOf(session.getAttribute("s_empcount")));
        String[] s_empid = (String[])session.getAttribute("s_empid");
        String[] s_empname = (String[])session.getAttribute("s_empname");
        String[] s_empdep = (String[])session.getAttribute("s_empdep");
        for(int i=1;i<=empcount;i++){
		%>
			<option value="<%=s_empid[i] %>"> <%=s_empname[i] %>&nbsp;(<%=s_empid[i] %>&nbsp;<%=s_empdep[i] %>) </option>
		<%	
		}
        %>
    </select>
	&nbsp;

      <input type="submit" name="submit" value="����" style="cursor:pointer;"/>
	  <input name="op" type="hidden" value="search" />
     </td>
  </tr>
  <tr>
  	<th width="142" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">���</font></th>
  	<th width="142" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">Ա�����</font></th>
    <th width="152" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">����</font></th>
    <th width="162" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">�������</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">����</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">�ٵ�</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">����</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">����</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">����</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">���</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">�Ӱ�</font></th>
  </tr>
  
  <%
  	String op=DateFormate.toGb((String)request.getParameter("op"));
  	String year=DateFormate.toGb((String)request.getParameter("year"));
    String empidindex=DateFormate.toGb((String)request.getParameter("empidindex"));
    //out.println("<script language='javascript'>alert('"+nowyear+"');</script>");
  	String sql="";
  	if("search".equals(op)){
  		if(empidindex.isEmpty()){
  			sql="SELECT emp_id,emp_name,sum(dayc_normal),sum(dayc_late),sum(dayc_early),sum(dayc_absence),sum(dayc_chuc),sum(dayc_holi),sum(dayc_overtime) from daycount where dayc_date like '"+year+"%' group by emp_id;";
  		}else if(!(empidindex.isEmpty())){
  			sql="SELECT emp_id,emp_name,sum(dayc_normal),sum(dayc_late),sum(dayc_early),sum(dayc_absence),sum(dayc_chuc),sum(dayc_holi),sum(dayc_overtime) from daycount where dayc_date like '"+year+"%' and emp_id='"+empidindex+"' group by emp_id;";
  		}
  	}else{
	    sql="SELECT emp_id,emp_name,sum(dayc_normal),sum(dayc_late),sum(dayc_early),sum(dayc_absence),sum(dayc_chuc),sum(dayc_holi),sum(dayc_overtime) from daycount where dayc_date like '"+nowyear+"%' group by emp_id;";
	 }
    
	DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		int i=0;
		while(rs.next())
		{
			i+=1;
  %>
		<tr>
  			<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=i %></font></span></td>
    		<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(1) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(2) %></font></span></td>
    		<%
    		if(!("search".equals(op))){
    		%>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=nowyear %></font></span></td>
    		<%
    		}else{
    		%>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=year %></font></span></td>
    		<%
    		}
    		%>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(3) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(4) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(5) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(6) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(7) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(8) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(9) %></font></span></td>
    	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("�±����ѯ���󣬴�����Ϣ��"+e.getMessage());
	}	
	db.close();
  %>
</table> 
</form>
</body>
</html>
