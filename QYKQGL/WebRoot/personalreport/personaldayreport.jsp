<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����ձ���</title>
<style type="text/css">
<!--
.STYLE1{
	font-size: 22px;
	font-family: ����;
	font-weight: bold;
}
.STYLE2 {
	font-size: 18px;
	font-family: ����;
}
-->
</style>
<script language="javascript">
</script>

</head>

<body>
<form name="personaldayreportform" action="personaldayreport.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1"  background="../img/intro_bg.jpg" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr>
  	<td height="40" colspan="5" align="center" valign="middle">
  	<strong><font size="6" face="����" color="#4B0082">�����ձ���</font></strong>&nbsp;&nbsp;&nbsp;
  	<input type="button" value="����" onclick="javascript:history.back();">
  	</td>
  </tr>
  <tr bgcolor="#9EC3F2">
  	<td height="25" colspan="3" align="center" valign="bottom"><font size="5" face="����" color="#9932CC">�������ڣ�</font>
  	<input type="text" name="daycdateindex" size="20"/>��ʾ����2015-06-26��
  	</td>
   
	<td height="25" colspan="2" align="center" valign="bottom">
      <input type="submit" name="submit" value="����" style="cursor:pointer;"/>
	  <input name="op" type="hidden" value="search" />
     </td>
  </tr>
  <tr>
  	<th width="162" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">���</font></th>
  	<th width="162" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">Ա�����</font></th>
    <th width="162" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">����</font></th>
    <th width="182" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">��������</font></th>
    <th width="182" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="����">�������</font></th>
    </tr>
  
  <%
  	String empid = String.valueOf(session.getAttribute("s_userid"));
  	String op=DateFormate.toGb((String)request.getParameter("op"));
  	String daycdateindex=DateFormate.toGb((String)request.getParameter("daycdateindex"));
    //out.println("<script language='javascript'>alert('"+empid+"');</script>");
    //out.println("<script language='javascript'>alert('"+daycdateindex+"');</script>");
  	String sql="";
  	if("search".equals(op)){
  		if(!(daycdateindex.isEmpty())){
  			sql="select * from daycount where dayc_date='"+daycdateindex+"' and emp_id='"+empid+"';";
  		}else if(daycdateindex.isEmpty()){
  			sql="select * from daycount where emp_id='"+empid+"' order by dayc_id desc;";
  		}
  	}else{
	    sql="select * from daycount where emp_id='"+empid+"' order by dayc_id desc;";
	 }
    
	DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		int i = 0;
		while(rs.next())
		{	
			i+=1;
			String normal = rs.getString(5); 
			String late = rs.getString(6);	
			String early = rs.getString(7);
			String absence = rs.getString(8);
			String chuchai = rs.getString(9);
			String holidays = rs.getString(10);
			String overtime = rs.getString(11);
			String checkstates = "";
			if("1".equals(normal)){
				checkstates = "����";
			}else if("1".equals(late)&"1".equals(early)){
				checkstates = "�ٵ�������";
			}else if("1".equals(late)&"1".equals(overtime)){
				checkstates = "�ٵ����Ӱ�";
			}else if("1".equals(late)){
				checkstates = "�ٵ�";
			}else if("1".equals(early)){
				checkstates = "����";
			}else if("1".equals(overtime)){
				checkstates = "�Ӱ�";
			}else if("1".equals(absence)){
				checkstates = "����";
			}else if("1".equals(chuchai)){
				checkstates = "����";
			}else if("1".equals(holidays)){
				checkstates = "���";
			}
			
  %>
		<tr>
  			<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=i %></font></span></td>
  			<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(2) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(3) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=rs.getString(4) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����"><%=checkstates %></font></span></td>
    	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("�ձ����ѯ���󣬴�����Ϣ��"+e.getMessage());
	}	
	db.close();
  %>
</table> 
</form>
</body>
</html>
