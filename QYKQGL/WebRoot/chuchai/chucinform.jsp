<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����¼</title>
<style type="text/css">
<!--
.STYLE1{
	font-size: 22px;
	font-face: ����;
	font-weight: bold;
}
.STYLE2 {
	font-size: 18px;
	font-face: ����;
}
-->
</style>
<script language="javascript">
	function check(){
		if(document.chucinformform.chucdateindex.value==""){
			alert("������������ڣ�");
			return false;
		}
	}

</script>
</head>

<body>
<form name="chucinformform" action="chucinform.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr style="background-color: #F0FFFF">
  	<td height="45" colspan="7" align="center" valign="middle">
  	<strong><font size="5" face="����" color="#4B0082">�����¼��ѯ</font></strong></td>
  </tr>
  <tr bgcolor="#9EC3F2">
    <td height="25" colspan="7" align="left" valign="middle"><font size="5" face="����" color="#9932CC">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ڣ�</font>
      <input name="chucdateindex" type="text" size="24" />��ʾ����2015-06-26��
      <input type="submit" name="submit" value="����" style="cursor:pointer;"/>
      <input name="op" type="hidden" value="search" />
    </td>
  </tr>
  <tr>
  	<th width="132" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">���</font></th>
    <th width="132" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">Ա�����</font></th>
    <th width="132" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">����</font></th>
    <th width="152" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">���ʼ����</font></th>
    <th width="152" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">�����������</font></th>
    <th width="152" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">����ص�</font></th>
    <th width="172" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">��������</font></th>
  </tr>
  
  <%
    String op = DateFormate.toGb((String)request.getParameter("op"));
    String chucdateindex = DateFormate.toGb((String)request.getParameter("chucdateindex"));
    String empid = String.valueOf(session.getAttribute("s_userid"));
    String sql="";
    if("search".equals(op)){
		sql="select * from chuchai where '"+chucdateindex+"' between chuc_begindate and chuc_enddate and emp_id='"+empid+"' order by chuc_id desc;";
    }else{
		sql="select * from chuchai where emp_id='"+empid+"' order by chuc_id desc;";
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
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(2) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(3) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(4) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(5) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(6) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(7) %></font></span></td>
    	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("�����¼��ѯ���󣬴�����Ϣ��"+e.getMessage());
	}
	db.close();
  %>
</table> 
</form>
</body>
</html>
