<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>������Ϣ�޸�</title>
    <style type="text/css">
	<!--
	.STYLE1{
		font-size: 22px;
		font-face: ����;
		font-weight: bold;
	}
	-->
	</style>
	
	<script language="javascript">
	function check(){
		var f = document.newsEditform;
		if(f.newnewstitle.value==""){
			alert("������ⲻ��Ϊ�գ�");
			f.newnewstitle.focus();
			return false;
		}
	}
	</script>	
  </head>
  
  <body>
  <% 
 	request.setCharacterEncoding("gb2312");
    String op = DateFormate.toGb((String)request.getParameter("op"));
    String newsid = DateFormate.toGb((String)request.getParameter("newsid"));
    String sql="";
    if("edit".equals(op)){
		sql="select * from news where news_id='"+newsid+"';";
    }
    DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		rs.next();
	%>
		<form name="newsEditform" action="newsUpdate.jsp" method="post" onsubmit="javascript:return check();"><br>
		<table width="88%" border="0" align="center" cellpadding="2" cellspacing="2" bgcolor="#9EC3F2" style="font-size:12px">
  		<tr background="img/bg_titlebarr.gif">
  			<td height="40" colspan="2" align="center" valign="middle">
  			<strong><font size="5" face="����" color="#4B0082">������Ϣ�޸�</font></strong>
  			</td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="20%" height="30" align="center" valign="middle">
   		    <span class="STYLE1"><font size="5" face="����">�������:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newnewstitle" size="100" value="<%=rs.getString(2)%>">
   		    &nbsp;<font color="red">**</font>
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="20%" height="30" align="center" valign="middle">
   		    <span class="STYLE1"><font size="5" face="����">��������:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newnewscontent" size="100" value="<%=rs.getString(3)%>">
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="20%" height="30" align="center" valign="middle" background="img/bg_titlebarr.gif">
   		    <span class="STYLE1"><font size="5" face="����">��������:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <select name="newnewsobject" size="1">
        <%
        %>
			<option value="<%=rs.getString(4) %>" selected><%=rs.getString(4) %> </option>
		<%
        int depcount = Integer.parseInt(String.valueOf(session.getAttribute("s_depcount")));
        String[] s_depno = (String[])session.getAttribute("s_depno");
        for(int i=1;i<=depcount;i++){
        	if(rs.getString(4).equalsIgnoreCase(s_depno[i]))
        	continue;
        	else{
			%>
				<option value="<%=s_depno[i] %>"> <%=s_depno[i] %> </option>
			<%
			}	
		}
        %>
           </select>
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="20%" height="30" align="center" valign="middle">
   		    <span class="STYLE1"><font size="5" face="����">����ʱ��:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input readonly type="text" name="newnewsaddtime" size="40" value="<%=rs.getString(5)%>">                                                                                         
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="25%" height="30" align="right" valign="middle">
   		    <span class="STYLE1"><font size="5" face="����">�Ƿ�������ʱ��:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="radio" name="yesorno" value="yes">��
   		    <input type="radio" name="yesorno" value="no" checked>��                                                                                         
   		    </td>
  		</tr>
  		 			
  		<tr>
  			<th height="35" colspan="2" style="background-color: #F0FFFF">
  			<input type="hidden" name="newsid" value="<%=newsid%>">
  			<input type="submit" name="submit" value="�޸�">&nbsp;
  			<input type="reset" name="reset" value="����">&nbsp;
  			<input type="button" value="����" onclick="javascript:history.back();">
  			</th>
  		</tr>
  		</table>
  		</form>
	<%
	rs.close();
	}catch(Exception e){
		System.out.println("������Ϣ�޸Ĵ��󣬴�����Ϣ��"+e.getMessage());
	}
	db.close();
  %> 
  </body>
</html>
