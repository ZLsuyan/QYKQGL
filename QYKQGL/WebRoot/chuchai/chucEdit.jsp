<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>出差信息修改</title>
    <style type="text/css">
	<!--
	.STYLE1{
		font-size: 22px;
		font-face: 楷体;
		font-weight: bold;
	}
	-->
	</style>
	
	<script language="javascript">
	function check(){
		var f = document.chucEditform;
		if(f.newempid.value==""){
			alert("员工姓名不能为空！");
			f.newempid.focus();
			return false;
		}
		if(f.newchucbegindate.value==""){
			alert("出差开始日期不能为空！");
			f.newchucbegindate.focus();
			return false;
		}
		if(f.newchucenddate.value==""){
			alert("出差结束日期不能为空！");
			f.newchucenddate.focus();
			return false;
		}
		if(f.newchucenddate.value<f.newchucbegindate.value){
			alert("出差结束日期不能在开始日期之前！");
			f.newchucenddate.focus();
			return false;
		}
	}
	</script>	
  </head>
  
  <body>
  <% 
 	request.setCharacterEncoding("gb2312");
    String op = DateFormate.toGb((String)request.getParameter("op"));
    String chucid = DateFormate.toGb((String)request.getParameter("chucid"));
    DB db=new DB();
    String sql="select emp_id from chuchai where chuc_id='"+chucid+"'";
    ResultSet rs=db.executeQuery(sql);
    String empid="";
    if(rs.next())
    {
    	empid = rs.getString(1);
    }
    rs.close();
    String sql2="select emp_name,emp_dep from employee where emp_id='"+empid+"'";
    ResultSet rs2=db.executeQuery(sql2);
    String empname = "";
    String empdep = "";
    if(rs2.next())
    {
    	empname = rs2.getString(1);
    	empdep = rs2.getString(2);
    }
    rs2.close();
    String sql3="";
    if("edit".equals(op)){
		sql3="select * from chuchai where chuc_id='"+chucid+"';";
    }
    try{
		ResultSet rs3=db.executeQuery(sql3);
		rs3.next();
	%>
		<form name="chucEditform" action="chucUpdate.jsp" method="post" onsubmit="javascript:return check();"><br>
		<table width="70%" border="0" align="center" cellpadding="2" cellspacing="2" bgcolor="#9EC3F2" style="font-size:12px">
  		<tr background="img/bg_titlebarr.gif">
  			<td height="40" colspan="2" align="center" valign="middle">
  			<strong><font size="5" face="楷体" color="#4B0082">出差通知修改</font></strong>
  			</td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="40%" height="30" align="right" valign="middle">
   		    <span class="STYLE1"><font size="5" face="楷体">员工姓名:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <select name="newempid" size="1">
   		    <option value="<%=empid %>"selected> <%=empname %>&nbsp;(<%=empid %>&nbsp;<%=empdep%>) </option>
      		<%
        	int generalcount = Integer.parseInt(String.valueOf(session.getAttribute("s_generalcount")));
        	String[] s_generalid = (String[])session.getAttribute("s_generalid");
        	String[] s_generalname = (String[])session.getAttribute("s_generalname");
        	String[] s_generaldep = (String[])session.getAttribute("s_generaldep");
        	for(int i=1;i<=generalcount;i++){
        		if(empid.equalsIgnoreCase(s_generalid[i]))
        		continue;
        		else{
        			%>
					<option value="<%=s_generalid[i]%>"> <%=s_generalname[i]%>&nbsp;(<%=s_generalid[i]%>&nbsp;<%=s_generaldep[i] %>) </option>
					<%	
				}
			}
       		%>
    		</select>
    		&nbsp;<font color="red">**</font>
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="40%" height="30" align="right" valign="middle">
   		    <span class="STYLE1"><font size="5" face="楷体">出差开始日期:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newchucbegindate" size="40" value="<%=rs3.getString(4)%>">
   		    &nbsp;(例如：2015-04-24)<font color="red">**</font>
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="40%" height="30" align="right" valign="middle" background="img/bg_titlebarr.gif">
   		    <span class="STYLE1"><font size="5" face="楷体">出差结束日期:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newchucenddate" size="40" value="<%=rs3.getString(5)%>">
   		    &nbsp;(例如：2015-04-25)<font color="red">**</font>
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="40%" height="30" align="right" valign="middle">
   		    <span class="STYLE1"><font size="5" face="楷体">出差地点:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newchucplace" size="40" value="<%=rs3.getString(6)%>">
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="40%" height="30" align="right" valign="middle" background="img/bg_titlebarr.gif">
   		    <span class="STYLE1"><font size="5" face="楷体">出差内容:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newchuccontent" size="40" value="<%=rs3.getString(7)%>">
   		    </td>
  		</tr>
  		
  		<tr>
  			<th height="35" colspan="2" style="background-color: #F0FFFF">
  			<input type="hidden" name="chucid" value="<%=chucid%>">
  			<input type="submit" name="submit" value="修改">&nbsp;
  			<input type="reset" name="reset" value="重置">&nbsp;
  			<input type="button" value="返回" onclick="javascript:history.back();">
  			</th>
  		</tr>
  		</table>
  		</form>
	<%
	rs.close();
	}catch(Exception e){
		System.out.println("出差通知修改错误，错误信息："+e.getMessage());
	}
	db.close();
  %> 
  </body>
</html>
