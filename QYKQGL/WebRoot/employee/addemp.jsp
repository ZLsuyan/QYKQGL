<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
	<title>���Ա����Ϣ</title>
	<style type="text/css">
	<!--
	.STYLE1 {
	font-size: 18px;
	font-weight: bold;
	font-face: ����;
	}
	.STYLE2 {
	font-size: 16px;
	font-face: ����;
	}
	-->
	</style>
	
	<script Language="JavaScript" type="text/JavaScript">
	function check(){
  		var f=document.addempform;
  		//var empidentityId = /^(\d{15}|\d{18})$/;
  		if (f.emptype.value=="admin"&&f.empid.value!="/^a[0-9_]{1,10}$/")
  		{
    		alert("����Ա��ű�����a��ͷ����������֣�");
    		f.empid.focus();
    		return false;
  		}
  		if (f.empid.value == "")
  		{
    		alert("������Ա����ţ�");
    		f.empid.focus();
    		return (false);
  		}  
  		if (f.empname.value == "")
  		{
    		alert("������Ա��������");
    		f.empname.focus();
    		return (false);
  		}
  		if (f.emppass.value == "")
  		{
    		alert("������Ա�����룡");
    		f.emppass.focus();
    		return (false);
  		}
  		if (f.empdep.value == "")
  		{
    		alert("��ѡ��Ա���������ţ�");
    		f.empdep.focus();
    		return (false);
  		}
  		if (f.empidentityid.value == "")
  		{
    		alert("������Ա�����֤�ţ�");
    		f.empidentityid.focus();
    		return (false);
  		}
  		if (f.emptel.value == "")
  		{
    		alert("������Ա���ֻ��ţ�");
    		f.emptel.focus();
    		return (false);
  		}
  		if(f.empemail.value!=""){
  			if((f.empemail.value.indexOf('@',0)==-1)||(f.empemail.value.indexOf('.',0)==-1)){
  				alert("�����ʽ����");
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
    <td height="40" colspan="4" align="center" valign="middle"><strong><font face="����" size="5" color="#9370DB">���Ա��������Ϣ</font></strong>&nbsp;<font color="#9370DB">**Ϊ����</font></td>
  </tr>
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">Ա�����:</span></td>
        <td width="180" align="left"><input name="empid" type="text" size="18">&nbsp;<font color="red">**</font></td>
        <td width="120" height="35" align="right"><span class="STYLE1">����:</span></td>
        <td width="180" align="left"><input name="empname" type="text" size="18">&nbsp;<font color="red">**</font></td>
      </tr>
      
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">�Ա�:</span></td>
        <td>          
        	<select name="empsex" size="1">
            <option value="��" selected>��</option>
            <option value="Ů">Ů</option>
            </select>
        &nbsp;<font color="red">**</font></td>
        <td align="right"><span class="STYLE1">��������:</span></td>
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
        <td width="120" height="35" align="right"><span class="STYLE1">Ա����ɫ:</span></td>
        <td width="180" align="left">
        	<input type="radio" name="emptype" value="general" checked>��ͨԱ��
        	<input type="radio" name="emptype" value="admin">����Ա&nbsp;<font color="red">**</font>
        </td>
        <td width="120" height="35" align="right"><span class="STYLE1">����:</span></td>
        <td width="180" align="left"><input name="emppass" type="text" size="18">&nbsp;<font color="red">**</font></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"> <span class="STYLE1">��ְ���: </span></td>
        <td><select name="empstatus" size="1">
          <option value="��ְ" selected>��ְ</option>
          <option value="��ְ">��ְ</option>
          <option value="��ְ">��ְ</option>
          <option value="����">����</option>
		  <option value="��Ƹ">��Ƹ</option>
		  <option value="����">����</option>
        	</select>
        &nbsp;<font color="red">**</font></td>
        <td height="35" align="right"> <span class="STYLE1">������ò:</span></td>
        <td height="35"><select name="emppolitics">
            <option value="�й���Ա" selected>�й���Ա</option>
            <option value="�й�Ԥ����Ա">�й�Ԥ����Ա</option>
            <option value="��Ա">��Ա</option>
			<option value="Ⱥ��">Ⱥ��</option>
			<option value="����">����</option>
          </select>
        &nbsp;<font color="red">**</font></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">����:</span></td>
        <td><input name="empjiguan" type="text" size="18">&nbsp;</td>
        <td align="right"><span class="STYLE1">����:</span></td>
        <td><input name="empnation" type="text"size="18">&nbsp;</td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">����״��:</span></td>
        <td><select name="empmarriage">
          <option value="δ��" selected>δ��</option>
          <option value="�ѻ�">�ѻ�</option>
          <option value="ɥż">ɥż</option>
          <option value="����">����</option>
        	</select>
        </td>
        <td height="35" align="right"><span class="STYLE1">ְ��:</span></td>
        <td><input name="empposition" type="text" size="18"></td>
      </tr>
     
      <tr>
        <td height="35" align="right"><span class="STYLE1">���֤��:</span></td>
        <td><input name="empidentityid" type="text" class="data" size="18" onKeyUp="value=value.replace(/[^\d]/g,'')">          
        &nbsp;<font color="red">**</font></td>
        <td height="35" align="right"><span class="STYLE1">ѧ��:</span></td>
        <td><select name="empeducation">
          <option value="����">����</option>
          <option value="����">����</option>
		  <option value="��ר">��ר</option>
          <option value="ר��">ר��</option>
          <option value="����" selected>����</option>
		  <option value="˶ʿ">˶ʿ</option>
		  <option value="��ʿ">��ʿ</option>
        	</select>      
        </td>
      </tr>
      
      <tr>
        <td height="35" align="right"> <span class="STYLE1">��������:</span></td>
        <td height="35"><select name="empforeign">
            <option value="Ӣ��" selected>Ӣ��</option>
            <option value="����">����</option>
            <option value="����">����</option>
            <option value="����">����</option>
            <option value="����">����</option>
			<option value="��������">��������</option>
			<option value="��������">��������</option>
			<option value="����">����</option>
          </select>
        </td>
        <td align="right"><span class="STYLE1">����ˮƽ:</span></td>
        <td><select name="emplevel">
          <option value="����" selected>����</option>
          <option value="�ļ�">�ļ�</option>
          <option value="����">����</option>
          <option value="�˼�">�˼�</option>
        	</select>
        </td>
      </tr>
      
      <tr>
        <td height="35" align="right"><span class="STYLE1">��ϵ�绰:</span></td>
        <td><input name="emptel" type="text" class="data" size="13" maxlength="13">&nbsp;<font color="red">**</font></td>
        <td align="right"><span class="STYLE1">����:</span></td>
        <td><input name="empemail" type="text" size="25" maxlength="30"></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">��ͥסַ:</span></td>
        <td><input name="empaddress" type="text" size="30"></td>
        <td align="center" align="right" valign="middle"><span class="STYLE1">��ְʱ��:</span></td>
    	<td><input name="empaddtime" type="text" size="25"></td>
      </tr>
      
      <tr>
        <td height="49" colspan="4" align="center">
          <input type="submit" name="submit" value="���">
          <input type="reset" name="reset" value="����">&nbsp;&nbsp;&nbsp;
          <input type="button" value="����" onclick="javascript:history.back();">
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
			out.println("<script language='javascript'>alert('��ϲ����Ա��������ӳɹ���');</script>");
			response.setHeader("refresh","0;url=empmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,Ա���������ʧ�ܣ�');</script>");
			
		}
	}
%>	  
</body>
</html>
