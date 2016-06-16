<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
	<title>添加员工信息</title>
	<style type="text/css">
	<!--
	.STYLE1 {
	font-size: 18px;
	font-weight: bold;
	font-face: 楷体;
	}
	.STYLE2 {
	font-size: 16px;
	font-face: 楷体;
	}
	-->
	</style>
	
	<script Language="JavaScript" type="text/JavaScript">
	function check(){
  		var f=document.addempform;
  		//var empidentityId = /^(\d{15}|\d{18})$/;
  		if (f.emptype.value=="admin"&&f.empid.value!="/^a[0-9_]{1,10}$/")
  		{
    		alert("管理员编号必须以a开头，后面跟数字！");
    		f.empid.focus();
    		return false;
  		}
  		if (f.empid.value == "")
  		{
    		alert("请输入员工编号！");
    		f.empid.focus();
    		return (false);
  		}  
  		if (f.empname.value == "")
  		{
    		alert("请输入员工姓名！");
    		f.empname.focus();
    		return (false);
  		}
  		if (f.emppass.value == "")
  		{
    		alert("请设置员工密码！");
    		f.emppass.focus();
    		return (false);
  		}
  		if (f.empdep.value == "")
  		{
    		alert("请选择员工所属部门！");
    		f.empdep.focus();
    		return (false);
  		}
  		if (f.empidentityid.value == "")
  		{
    		alert("请输入员工身份证号！");
    		f.empidentityid.focus();
    		return (false);
  		}
  		if (f.emptel.value == "")
  		{
    		alert("请输入员工手机号！");
    		f.emptel.focus();
    		return (false);
  		}
  		if(f.empemail.value!=""){
  			if((f.empemail.value.indexOf('@',0)==-1)||(f.empemail.value.indexOf('.',0)==-1)){
  				alert("邮箱格式错误！");
  				f.empemail.focus();
  				return false;
  			}
  		}
	}

	</script>
</head>

<body>
<form name="addempform" action="addemp.jsp" method="post" onsubmit="javascript:return check();">
 <br>
<table width="800" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#E6E6FA">
  <tr>
    <td height="40" colspan="4" align="center" valign="middle"><strong><font face="楷体" size="5" color="#9370DB">添加员工档案信息</font></strong>&nbsp;<font color="#9370DB">**为必填</font></td>
  </tr>
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">员工编号:</span></td>
        <td width="180" align="left"><input name="empid" type="text" size="18">&nbsp;<font color="red">**</font></td>
        <td width="120" height="35" align="right"><span class="STYLE1">姓名:</span></td>
        <td width="180" align="left"><input name="empname" type="text" size="18">&nbsp;<font color="red">**</font></td>
      </tr>
      
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">性别:</span></td>
        <td>          
        	<select name="empsex" size="1">
            <option value="男" selected>男</option>
            <option value="女">女</option>
            </select>
        &nbsp;<font color="red">**</font></td>
        <td align="right"><span class="STYLE1">所属部门:</span></td>
        <td><select name="empdep" size="1">
        <%
        int depcount = Integer.parseInt(String.valueOf(session.getAttribute("s_depcount")));
        String[] s_depno = (String[])session.getAttribute("s_depno");
        for(int i=1;i<=depcount;i++){
		%>
			<option value="<%=s_depno[i] %>"> <%=s_depno[i] %> </option>
		<%	
		}
        %>
           </select>
         &nbsp;<font color="red">**</font></td>
      </tr>
      
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">员工角色:</span></td>
        <td width="180" align="left">
        	<input type="radio" name="emptype" value="general" checked>普通员工
        	<input type="radio" name="emptype" value="admin">管理员&nbsp;<font color="red">**</font>
        </td>
        <td width="120" height="35" align="right"><span class="STYLE1">密码:</span></td>
        <td width="180" align="left"><input name="emppass" type="text" size="18">&nbsp;<font color="red">**</font></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"> <span class="STYLE1">在职情况: </span></td>
        <td><select name="empstatus" size="1">
          <option value="在职" selected>在职</option>
          <option value="兼职">兼职</option>
          <option value="离职">离职</option>
          <option value="退休">退休</option>
		  <option value="待聘">待聘</option>
		  <option value="其他">其他</option>
        	</select>
        &nbsp;<font color="red">**</font></td>
        <td height="35" align="right"> <span class="STYLE1">政治面貌:</span></td>
        <td height="35"><select name="emppolitics">
            <option value="中共党员" selected>中共党员</option>
            <option value="中共预备党员">中共预备党员</option>
            <option value="团员">团员</option>
			<option value="群众">群众</option>
			<option value="其他">其他</option>
          </select>
        &nbsp;<font color="red">**</font></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">籍贯:</span></td>
        <td><input name="empjiguan" type="text" size="18">&nbsp;</td>
        <td align="right"><span class="STYLE1">民族:</span></td>
        <td><input name="empnation" type="text"size="18">&nbsp;</td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">婚姻状况:</span></td>
        <td><select name="empmarriage">
          <option value="未婚" selected>未婚</option>
          <option value="已婚">已婚</option>
          <option value="丧偶">丧偶</option>
          <option value="离异">离异</option>
        	</select>
        </td>
        <td height="35" align="right"><span class="STYLE1">职称:</span></td>
        <td><input name="empposition" type="text" size="18"></td>
      </tr>
     
      <tr>
        <td height="35" align="right"><span class="STYLE1">身份证号:</span></td>
        <td><input name="empidentityid" type="text" class="data" size="18" onKeyUp="value=value.replace(/[^\d]/g,'')">          
        &nbsp;<font color="red">**</font></td>
        <td height="35" align="right"><span class="STYLE1">学历:</span></td>
        <td><select name="empeducation">
          <option value="初中">初中</option>
          <option value="高中">高中</option>
		  <option value="中专">中专</option>
          <option value="专科">专科</option>
          <option value="本科" selected>本科</option>
		  <option value="硕士">硕士</option>
		  <option value="博士">博士</option>
        	</select>      
        </td>
      </tr>
      
      <tr>
        <td height="35" align="right"> <span class="STYLE1">外语语种:</span></td>
        <td height="35"><select name="empforeign">
            <option value="英语" selected>英语</option>
            <option value="日语">日语</option>
            <option value="德语">德语</option>
            <option value="法语">法语</option>
            <option value="俄语">俄语</option>
			<option value="阿拉伯语">阿拉伯语</option>
			<option value="西班牙语">西班牙语</option>
			<option value="其他">其他</option>
          </select>
        </td>
        <td align="right"><span class="STYLE1">外语水平:</span></td>
        <td><select name="emplevel">
          <option value="三级" selected>三级</option>
          <option value="四级">四级</option>
          <option value="六级">六级</option>
          <option value="八级">八级</option>
        	</select>
        </td>
      </tr>
      
      <tr>
        <td height="35" align="right"><span class="STYLE1">联系电话:</span></td>
        <td><input name="emptel" type="text" class="data" size="13" maxlength="13">&nbsp;<font color="red">**</font></td>
        <td align="right"><span class="STYLE1">邮箱:</span></td>
        <td><input name="empemail" type="text" size="25" maxlength="30"></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">家庭住址:</span></td>
        <td><input name="empaddress" type="text" size="30"></td>
        <td align="center" align="right" valign="middle"><span class="STYLE1">入职时间:</span></td>
    	<td><input name="empaddtime" type="text" size="25"></td>
      </tr>
      
      <tr>
        <td height="49" colspan="4" align="center">
          <input type="submit" name="submit" value="添加">
          <input type="reset" name="reset" value="重置">&nbsp;&nbsp;&nbsp;
          <input type="button" value="返回" onclick="javascript:history.back();">
        </td>
      </tr>
	</table>	
</form>    

<% 
 	request.setCharacterEncoding("gb2312");
	String submit=request.getParameter("submit");
	if(submit!=null&&!submit.equals(""))
	{
		String empid=request.getParameter("empid");
		String empname=request.getParameter("empname");
		String empsex=request.getParameter("empsex");
		String empdep=request.getParameter("empdep");
		String emptype=request.getParameter("emptype");
		String emppass=request.getParameter("emppass");
		String empstatus=request.getParameter("empstatus");
		String emppolitics=request.getParameter("emppolitics");
		String empjiguan=request.getParameter("empjiguan");
		String empnation=request.getParameter("empnation");
		String empmarriage=request.getParameter("empmarriage");
		String empposition=request.getParameter("empposition");
		String empidentityid=request.getParameter("empidentityid");
		String empeducation=request.getParameter("empeducation");
		String empforeign=request.getParameter("empforeign");
		String emplever=request.getParameter("emplever");
		String emptel=request.getParameter("emptel");
		String empemail=request.getParameter("empemail");
		String empaddress=request.getParameter("empaddress");
		String empaddtime=request.getParameter("empaddtime");
		EmpManage em = new EmpManage();
		if(em.add(empid,empname,empsex,empdep,emptype,emppass,empstatus,emppolitics,empjiguan,empnation,empmarriage,empposition,empidentityid,empeducation,empforeign,emplever,emptel,empemail,empaddress,empaddtime))
		{
			out.println("<script language='javascript'>alert('恭喜您，员工档案添加成功！');</script>");
			response.setHeader("refresh","0;url=empmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,员工档案添加失败！');</script>");
			
		}
	}
%>	  
</body>
</html>
