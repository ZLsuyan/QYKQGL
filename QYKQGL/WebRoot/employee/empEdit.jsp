<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>员工信息修改</title>
    <style type="text/css">
	<!--
	.STYLE1{
		font-size: 18px;
		font-face: 楷体;
		font-weight: bold;
	}
	-->
	</style>
	
	<script language="javascript">
	function check(){
		var f = document.empEditform;
		if(f.newempid.value==""){
			alert("员工编号不能为空！");
			f.newempid.focus();
			return false;
		}
		if(f.newempname.value==""){
			alert("员工姓名不能为空！");
			f.newempname.focus();
			return false;
		}
		if(f.newempsex.value==""){
			alert("员工性别不能为空！");
			f.newempsex.focus();
			return false;
		}
		if(f.newempdep.value==""){
			alert("所属部门不能为空！");
			f.newempdep.focus();
			return false;
		}
		if(f.newemptype.value==""){
			alert("员工角色不能为空！");
			f.newemptype.focus();
			return false;
		}
		if(f.newemppass.value==""){
			alert("密码不能为空！");
			f.newemppass.focus();
			return false;
		}
		if(f.newempidentityid.value==""){
			alert("身份证号不能为空！");
			f.newempidentityid.focus();
			return false;
		}
		if(f.newemptel.value==""){
			alert("联系电话不能为空！");
			f.newemptel.focus();
			return false;
		}
	}
	</script>
	<%
	request.setCharacterEncoding("gb2312");
    String empid=DateFormate.toGb((String)request.getParameter("empid"));
	String sql2="select emp_status,emp_politics,emp_marriage,emp_education,emp_foreign,emp_lever from employee where emp_id='"+empid+"';";
	String empstatus = "";
	String emppolitics = "";
	String empmarriage = "";
	String empeducation = "";
	String empforeign = "";
	String emplever = "";
	DB db2 = new DB();
	try{
		ResultSet rs2 = db2.executeQuery(sql2);
		if(rs2.next()){
			empstatus = rs2.getString(1);
			emppolitics = rs2.getString(2);
			empmarriage = rs2.getString(3);
			empeducation = rs2.getString(4);
			empforeign = rs2.getString(5);
			emplever = rs2.getString(6);
			rs2.close();
		}
	}catch(Exception e){
	}
	
	db2.close();
%>	
  </head>
  
  <body>
  <% 
 	request.setCharacterEncoding("gb2312");
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String sql="";
    if("edit".equals(op)){
		sql="select * from employee where emp_id='"+empid+"';";
    }
    DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		rs.next();
	%>
<form name="empEditform" action="empUpdate.jsp" method="post" onsubmit="javascript:return check();"><br>
<table width="800" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#E6E6FA">
  <tr>
    <td height="40" colspan="4" align="center" valign="middle"><strong><font face="楷体" size="5" color="#9370DB">修改员工档案信息</font></strong></td>
  </tr>
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">员工编号:</span></td>
        <td width="180" align="left"><input name="newempid" type="text" size="18" value="<%=rs.getString(1)%>">&nbsp;*</td>
        <td width="120" height="35" align="right"><span class="STYLE1">姓名:</span></td>
        <td width="180" align="left"><input name="newempname" type="text" size="18" value="<%=rs.getString(2)%>">&nbsp;*</td>
      </tr>
      
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">性别:</span></td>
        <td>          
        	<select name="newempsex" size="1">
        	<% 
        	if(rs.getString(3).equalsIgnoreCase("男")){
        	%>
            	<option value="男" selected>男</option>
            	<option value="女">女</option>
            <% 
            }else{
            %>	
            	<option value="女" selected>女</option>
            	<option value="男">男</option>
            <%
            }
            %>	
            </select>
        *</td>
        <td align="right"><span class="STYLE1">所属部门:</span></td>
        <td><select name="newempdep" size="1">
        <%
        int depcount = Integer.parseInt(String.valueOf(session.getAttribute("s_depcount")));
        String[] s_depno = (String[])session.getAttribute("s_depno");
        %>
        <option value="<%=rs.getString(4) %>" selected> <%=rs.getString(4) %> </option>
        <%
        for(int i=1;i<=depcount;i++){
		%>
			<%
       		if(s_depno[i].equalsIgnoreCase(rs.getString(4)))
       		continue;
       		else{
       			%>
				<option value="<%=s_depno[i] %>"> <%=s_depno[i] %> </option>
				<%	
       		}	
		}
        %>
           </select>
         *</td>
      </tr>
      
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">员工角色:</span></td>
        <td width="180" align="left">
        	<% if(rs.getString(5).equalsIgnoreCase("admin")){
        	%>
            	<input type="radio" name="newemptype" value="admin" checked>管理员
        		<input type="radio" name="newemptype" value="general">普通员工&nbsp;*
            <% 
            }else{
            %>	
            	<input type="radio" name="newemptype" value="general" checked>普通员工
        		<input type="radio" name="newemptype" value="admin">管理员&nbsp;*
            <%
            }
            %>	
        </td>
        <td width="120" height="35" align="right"><span class="STYLE1">密码:</span></td>
        <td width="180" align="left"><input name="newemppass" type="text" size="18" value="<%=rs.getString(6)%>">&nbsp;*</td>
      </tr>
      
      <tr>
      	<td height="35" align="right"> <span class="STYLE1">在职情况: </span></td>
        <td><select name="newempstatus" size="1">
        	<option value="<%= empstatus%>" selected><%=empstatus %></option>
        	<%
        	String [] emp_status = new String [6];
        	emp_status[0]="在职";
        	emp_status[1]="兼职";
        	emp_status[2]="离职";
        	emp_status[3]="退休";
        	emp_status[4]="待聘";
        	emp_status[5]="其他";
        	for(int i=0;i<6;i++)
        	{
        		if(empstatus.equalsIgnoreCase(emp_status[i]))
        		continue;
        		else{
        			%><option value="<%= emp_status[i]%>"><%= emp_status[i]%></option><%
        		}
        	}
        	 %>
        	</select>
        </td>           
        <td height="35" align="right"> <span class="STYLE1">政治面貌:</span></td>
        <td><select name="newemppolitics" size="1">
        	<option value="<%= emppolitics%>" selected><%=emppolitics %></option>
        	<%
        	String [] emp_politics = new String [5];
        	emp_politics[0]="中共党员";
        	emp_politics[1]="中共预备党员";
        	emp_politics[2]="团员";
        	emp_politics[3]="群众";
        	emp_politics[4]="其他";
        	for(int i=0;i<5;i++)
        	{
        		if(emppolitics.equalsIgnoreCase(emp_politics[i]))
        		continue;
        		else{
        			%><option value="<%= emp_politics[i]%>"><%= emp_politics[i]%></option><%
        		}
        	}
        	 %>
        	</select>
        </td> 
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">籍贯:</span></td>
        <td><input name="newempjiguan" type="text" size="18" value="<%=rs.getString(9)%>"></td>
        <td align="right"><span class="STYLE1">民族:</span></td>
        <td><input name="newempnation" type="text"size="18" value="<%=rs.getString(10)%>"></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">婚姻状况:</span></td>
        <td><select name="newempmarriage" size="1">
        	<option value="<%= empmarriage%>" selected><%=empmarriage %></option>
        	<%
        	String [] emp_marriage = new String [4];
        	emp_marriage[0]="未婚";
        	emp_marriage[1]="已婚";
        	emp_marriage[2]="丧偶";
        	emp_marriage[3]="离异";
        	for(int i=0;i<4;i++)
        	{
        		if(empmarriage.equalsIgnoreCase(emp_marriage[i]))
        		continue;
        		else{
        			%><option value="<%= emp_marriage[i]%>"><%= emp_marriage[i]%></option><%
        		}
        	}
        	 %>
        	</select>
        </td> 
        <td height="35" align="right"><span class="STYLE1">职称:</span></td>
        <td><input name="newempposition" type="text"size="18" value="<%=rs.getString(12)%>"></td>
      </tr>
     
      <tr>
        <td height="35" align="right"><span class="STYLE1">身份证号:</span></td>
        <td><input name="newempidentityid" type="text" class="data" size="18" value="<%=rs.getString(13)%>"> *</td>
        <td height="35" align="right"><span class="STYLE1">学历:</span></td>
        <td><select name="newempeducation" size="1">
        	<option value="<%= empeducation%>" selected><%=empeducation %></option>
        	<%
        	String [] emp_education = new String [7];
        	emp_education[0]="初中";
        	emp_education[1]="高中";
        	emp_education[2]="中专";
        	emp_education[3]="专科";
        	emp_education[4]="本科";
        	emp_education[5]="硕士";
        	emp_education[6]="博士";
        	for(int i=0;i<7;i++)
        	{
        		if(empeducation.equalsIgnoreCase(emp_education[i]))
        		continue;
        		else{
        			%><option value="<%= emp_education[i]%>"><%= emp_education[i]%></option><%
        		}
        	}
        	 %>
        	</select>
        </td>
      </tr>
      
      <tr>
        <td height="35" align="right"> <span class="STYLE1">外语语种:</span></td>
        <td><select name="newempforeign" size="1">
        	<option value="<%= empforeign%>" selected><%=empforeign %></option>
        	<%
        	String [] emp_foreign = new String [8];
        	emp_foreign[0]="英语";
        	emp_foreign[1]="日语";
        	emp_foreign[2]="德语";
        	emp_foreign[3]="法语";
        	emp_foreign[4]="俄语";
        	emp_foreign[5]="阿拉伯语";
        	emp_foreign[6]="西班牙语";
        	emp_foreign[7]="其他";
        	for(int i=0;i<8;i++)
        	{
        		if(empforeign.equalsIgnoreCase(emp_foreign[i]))
        		continue;
        		else{
        			%><option value="<%= emp_foreign[i]%>"><%= emp_foreign[i]%></option><%
        		}
        	}
        	 %>
        	</select>
        </td>
        <td align="right"><span class="STYLE1">外语水平:</span></td>
        <td><select name="newemplever" size="1">
        	<option value="<%= emplever%>" selected><%=emplever %></option>
        	<%
        	String [] emp_lever = new String [4];
        	emp_lever[0]="三级";
        	emp_lever[1]="四级";
        	emp_lever[2]="六级";
        	emp_lever[3]="八级";
        	for(int i=0;i<4;i++)
        	{
        		if(emplever.equalsIgnoreCase(emp_lever[i]))
        		continue;
        		else{
        			%><option value="<%= emp_lever[i]%>"><%= emp_lever[i]%></option><%
        		}
        	}
        	 %>
        	</select>
        </td>
      </tr>
      
      <tr>
        <td height="35" align="right"><span class="STYLE1">联系电话:</span></td>
        <td><input name="newemptel" type="text" class="data" size="13" maxlength="13" value="<%=rs.getString(17)%>">&nbsp;*</td>
        <td align="right"><span class="STYLE1">邮箱:</span></td>
        <td><input name="newempemail" type="text" size="25" maxlength="30" value="<%=rs.getString(18)%>"></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">家庭住址:</span></td>
        <td><input name="newempaddress" type="text" size="20" value="<%=rs.getString(19)%>"></td>
        <td align="center" align="right" valign="middle"><span class="STYLE1">入职时间:</span></td>
    	<td align="left" valign="middle"><input name="newempaddtime" type="text" size="20" value="<%=rs.getString(20)%>"/>
        </td>
      </tr>
      
      <tr>
        <td height="49" colspan="4" align="center">
          <input type="hidden" name="empid" value="<%=empid%>">
          <input type="submit" name="submit" value="修改">
          <input type="reset" name="reset" value="重置">
          <input type="button" value="返回" onclick="javascript:history.back();">
        </td>
      </tr>
	</table>	
</form>    
	<%
	rs.close();
	}catch(Exception e){
		System.out.println("员工信息修改错误，错误信息："+e.getMessage());
	}
	db.close();
  %> 
  </body>
</html>
