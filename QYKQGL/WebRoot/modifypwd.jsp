<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="error.jsp"%>
<%@ page import="mypackage.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�޸ĸ�������</title>

<%
String op=DateFormate.toGb((String)request.getParameter("op"));
  if("modifypwd".equals(op)){
	String DBoldpwd=DateFormate.toGb((String)session.getAttribute("s_userpassword"));
	String oldpwd=DateFormate.toGb((String)request.getParameter("oldpwd"));
	String newpwd=DateFormate.toGb((String)request.getParameter("newpwd"));
	String usertype=DateFormate.toGb((String)session.getAttribute("s_usertype"));
	String userid=DateFormate.toGb((String)(String)session.getAttribute("s_userid"));
	System.out.println(usertype+"     "+userid);
	
	if(!oldpwd.equals(DBoldpwd)){
		%>
		<script language="javascript">
		alert("ԭʼ�������");
		document.location.href="modifypwd.html";
		</script>
		<%			
	}else{
		//mp.setPassword(userid,usertype,newpwd); 	
		String sql="update employee set emp_pass='"+newpwd+"' where emp_id='"+userid+"' and emp_type='"+usertype+"'";
		DB db=new DB();
		try{
			if(db.executeUpdate(sql)==1){
				%>
				<script language="javascript">
				alert("��ϲ�����޸�����ɹ���������Ϊ<%=newpwd%>");
				</script>
				<%	
				session.setAttribute("s_userpassword",newpwd);
			}
			else{
				%>
				<script language="javascript">
				alert("��Ǹ���޸�����ʧ�ܣ�");
				</script>
				<%	
			}
		}catch(Exception e){
			System.out.println("�޸�������󣬴�����Ϣ��"+e.getMessage());
		}
		db.close();
	}
	
} 
%>
</head>

<body>
</body>
</html>
