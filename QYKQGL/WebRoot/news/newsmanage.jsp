<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�������</title>
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
	function del(newsid){
		if(confirm("�����Ҫɾ��ѡ��ļ�¼��")){
				document.location.href="newsDelete.jsp?op=del&newsid="+newsid;
		}	
	}
	function check(){
		if(document.newsform.newsobject.value==""){
			alert("�����벿�����Ʋ�ѯ��");
			return false;
		}
	}
	
</script>
<%
	DB db2=new DB();
	String sql2="select count(dep_name) from department;";
	try{
		ResultSet rs2 = db2.executeQuery(sql2);
		if(rs2.next()){
			int depcount = rs2.getInt(1);
			session.setAttribute("s_depcount",depcount);
			rs2.close();
			if(depcount>0){
			String sql3="select dep_name from department order by dep_name;";
			try{
				ResultSet rs3 = db2.executeQuery(sql3);
				String[] s_depno=new String[300];
			  	for(int i=1;i<=depcount;i++){
					rs3.next();
					s_depno[i] = rs3.getString(1);
				}
			 	session.setAttribute("s_depno",s_depno);
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
<form name="newsform" action="newsmanage.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr style="background-color: #F0FFFF">
  	<td height="45" colspan="8" align="center" valign="middle">
  	<strong><font size="5" face="����" color="#4B0082">������Ϣ����</font></strong></td>
  </tr>
  <tr bgcolor="#9EC3F2">
    <td height="25" colspan="3" align="center" valign="middle">
    <span class="STYLE1"><font size="5" face="����">[<a href="addnews.jsp">��������</a>]</font></span></td>
    <td height="25" colspan="1" align="center" valign="bottom"><font size="5" face="����" color="#9932CC">�������ƣ�</font></td>
      <td><select name="newsobject" size="1">
        <%
        %>
			<option value="" selected></option>
			<option value="���в���">���в��� </option>
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
      </td>
      <td>
      <input type="submit" name="submit" value="����" style="cursor:pointer;"/>
      <input name="op" type="hidden" value="search" /></td>
  </tr>
  <tr>
  	<th width="92" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">���</font></th>
    <th width="262" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">�������</font></th>
    <th width="262" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">���ݼ���</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">��������</font></th>
    <th width="212" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">����ʱ��</font></th>
    <th width="112" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">����</font></th>
  </tr>
  
  <%
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String newsobject=DateFormate.toGb((String)request.getParameter("newsobject"));
    String sql="";
    if("search".equals(op)){
		sql="select * from news where news_object='"+newsobject+"' order by news_id desc;";
    }else{
		sql="select * from news order by news_id desc;";
    }
	DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		int i = 0;
		while(rs.next())
		{
			i+=1;
  %>
		<tr>
  			<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=i %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><a href="newscontent.jsp?newsid=<%=rs.getString(1)%>"><font face="����"><%=rs.getString(2).substring(0,12)%>...</font></a></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(3).substring(0,15)%>...</font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(4) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(5) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2" onclick="javasciprt:edit();"><a href="newsEdit.jsp?op=edit&newsid=<%=rs.getString(1)%>"><font face="����" color="black">�޸�</font></a>/</span>
    		<span class="STYLE2" onclick="javasciprt:del();"><a href="newsDelete.jsp?op=del&newsid=<%=rs.getString(1)%>"><font face="����" color="black">ɾ��</font></a></span></td>
 	 	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("������Ϣ��ѯ���󣬴�����Ϣ��"+e.getMessage()); 
	}

	db.close();
  %>
</table> 
</form>
</body>
</html>