<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����鿴</title>
<style type="text/css">
<!--
.STYLE1{
	font-size: 22px;
	font-face: ����;
	font-weight: bold;
}
.STYLE2 {
	font-size: 19px;
	font-face: ����;
}
-->
</style>
<script language="javascript">
	function check(){
		if(document.newsrecordform.newsaddtimeindex.value==""){
			alert("�����빫��������ڣ�");
			return false;
		}
	}
	
</script>
</head>

<body>
<form name="newsrecordform" action="newsrecord.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr style="background-color: #F0FFFF">
  	<td height="45" colspan="5" align="center" valign="middle">
  	<strong><font size="5" face="����" color="#4B0082">����鿴</font></strong></td>
  </tr>
  <tr bgcolor="#9EC3F2">
    <td height="25" colspan="5" align="left" valign="middle"><font size="5" face="����" color="#9932CC">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���淢�����ڣ�</font>
      <input name="newsaddtimeindex" type="text" size="24" />��ʾ����2015-06-26��&nbsp;&nbsp;
      <input type="submit" name="submit" value="����" style="cursor:pointer;"/>
      <input name="op" type="hidden" value="search" />
    </td>
  </tr>
  <tr>
  	<th width="92" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">���</font></th>
    <th width="262" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">�������</font></th>
    <th width="262" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">���ݼ���</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">��������</font></th>
    <th width="192" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">���淢��ʱ��</font></th>
  </tr>
  
  <%
    String op = DateFormate.toGb((String)request.getParameter("op"));
    String newsaddtimeindex = DateFormate.toGb((String)request.getParameter("newsaddtimeindex"));
    String empid = String.valueOf(session.getAttribute("s_userid"));
    DB db=new DB();
    String sql="select emp_dep from employee where emp_id='"+empid+"';";
    ResultSet rs=db.executeQuery(sql);
    String empdep = "";
    if(rs.next())
    {
    	empdep = rs.getString(1);
    }
    rs.close();
    String sql2="";
    if("search".equals(op)){
		sql2="select * from news where news_addtime like '"+newsaddtimeindex+"%' and (news_object='"+empdep+"' or news_object='���в���') order by news_id desc;";
    }else{
		sql2="select * from news where news_object='"+empdep+"' or news_object='���в���' order by news_id desc;";
    }
	try{
		ResultSet rs2=db.executeQuery(sql2);
		int i=0;
		while(rs2.next())
		{
			i+=1;
  %>
		<tr>
  			<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=i %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><a href="newscontent.jsp?newsid=<%=rs2.getString(1)%>"><font face="����"><%=rs2.getString(2).substring(0,12) %>...</font></a></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs2.getString(3).substring(0,14) %>...</font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs2.getString(4) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs2.getString(5) %></font></span></td>
    	</tr>
  <%
		}
		rs2.close();
	}catch(Exception e){
		System.out.println("�����ѯ���󣬴�����Ϣ��"+e.getMessage());
	}
	db.close();
  %>
</table> 
</form>
</body>
</html>
