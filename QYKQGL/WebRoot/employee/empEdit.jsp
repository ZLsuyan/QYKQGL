<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Ա����Ϣ�޸�</title>
    <style type="text/css">
	<!--
	.STYLE1{
		font-size: 18px;
		font-face: ����;
		font-weight: bold;
	}
	-->
	</style>
	
	<script language="javascript">
	function check(){
		var f = document.empEditform;
		if(f.newempid.value==""){
			alert("Ա����Ų���Ϊ�գ�");
			f.newempid.focus();
			return false;
		}
		if(f.newempname.value==""){
			alert("Ա����������Ϊ�գ�");
			f.newempname.focus();
			return false;
		}
		if(f.newempsex.value==""){
			alert("Ա���Ա���Ϊ�գ�");
			f.newempsex.focus();
			return false;
		}
		if(f.newempdep.value==""){
			alert("�������Ų���Ϊ�գ�");
			f.newempdep.focus();
			return false;
		}
		if(f.newemptype.value==""){
			alert("Ա����ɫ����Ϊ�գ�");
			f.newemptype.focus();
			return false;
		}
		if(f.newemppass.value==""){
			alert("���벻��Ϊ�գ�");
			f.newemppass.focus();
			return false;
		}
		if(f.newempidentityid.value==""){
			alert("���֤�Ų���Ϊ�գ�");
			f.newempidentityid.focus();
			return false;
		}
		if(f.newemptel.value==""){
			alert("��ϵ�绰����Ϊ�գ�");
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
    <td height="40" colspan="4" align="center" valign="middle"><strong><font face="����" size="5" color="#9370DB">�޸�Ա��������Ϣ</font></strong></td>
  </tr>
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">Ա�����:</span></td>
        <td width="180" align="left"><input name="newempid" type="text" size="18" value="<%=rs.getString(1)%>">&nbsp;*</td>
        <td width="120" height="35" align="right"><span class="STYLE1">����:</span></td>
        <td width="180" align="left"><input name="newempname" type="text" size="18" value="<%=rs.getString(2)%>">&nbsp;*</td>
      </tr>
      
      <tr>
        <td width="120" height="35" align="right"><span class="STYLE1">�Ա�:</span></td>
        <td>          
        	<select name="newempsex" size="1">
        	<% 
        	if(rs.getString(3).equalsIgnoreCase("��")){
        	%>
            	<option value="��" selected>��</option>
            	<option value="Ů">Ů</option>
            <% 
            }else{
            %>	
            	<option value="Ů" selected>Ů</option>
            	<option value="��">��</option>
            <%
            }
            %>	
            </select>
        *</td>
        <td align="right"><span class="STYLE1">��������:</span></td>
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
        <td width="120" height="35" align="right"><span class="STYLE1">Ա����ɫ:</span></td>
        <td width="180" align="left">
        	<% if(rs.getString(5).equalsIgnoreCase("admin")){
        	%>
            	<input type="radio" name="newemptype" value="admin" checked>����Ա
        		<input type="radio" name="newemptype" value="general">��ͨԱ��&nbsp;*
            <% 
            }else{
            %>	
            	<input type="radio" name="newemptype" value="general" checked>��ͨԱ��
        		<input type="radio" name="newemptype" value="admin">����Ա&nbsp;*
            <%
            }
            %>	
        </td>
        <td width="120" height="35" align="right"><span class="STYLE1">����:</span></td>
        <td width="180" align="left"><input name="newemppass" type="text" size="18" value="<%=rs.getString(6)%>">&nbsp;*</td>
      </tr>
      
      <tr>
      	<td height="35" align="right"> <span class="STYLE1">��ְ���: </span></td>
        <td><select name="newempstatus" size="1">
        	<option value="<%= empstatus%>" selected><%=empstatus %></option>
        	<%
        	String [] emp_status = new String [6];
        	emp_status[0]="��ְ";
        	emp_status[1]="��ְ";
        	emp_status[2]="��ְ";
        	emp_status[3]="����";
        	emp_status[4]="��Ƹ";
        	emp_status[5]="����";
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
        <td height="35" align="right"> <span class="STYLE1">������ò:</span></td>
        <td><select name="newemppolitics" size="1">
        	<option value="<%= emppolitics%>" selected><%=emppolitics %></option>
        	<%
        	String [] emp_politics = new String [5];
        	emp_politics[0]="�й���Ա";
        	emp_politics[1]="�й�Ԥ����Ա";
        	emp_politics[2]="��Ա";
        	emp_politics[3]="Ⱥ��";
        	emp_politics[4]="����";
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
      	<td height="35" align="right"><span class="STYLE1">����:</span></td>
        <td><input name="newempjiguan" type="text" size="18" value="<%=rs.getString(9)%>"></td>
        <td align="right"><span class="STYLE1">����:</span></td>
        <td><input name="newempnation" type="text"size="18" value="<%=rs.getString(10)%>"></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">����״��:</span></td>
        <td><select name="newempmarriage" size="1">
        	<option value="<%= empmarriage%>" selected><%=empmarriage %></option>
        	<%
        	String [] emp_marriage = new String [4];
        	emp_marriage[0]="δ��";
        	emp_marriage[1]="�ѻ�";
        	emp_marriage[2]="ɥż";
        	emp_marriage[3]="����";
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
        <td height="35" align="right"><span class="STYLE1">ְ��:</span></td>
        <td><input name="newempposition" type="text"size="18" value="<%=rs.getString(12)%>"></td>
      </tr>
     
      <tr>
        <td height="35" align="right"><span class="STYLE1">���֤��:</span></td>
        <td><input name="newempidentityid" type="text" class="data" size="18" value="<%=rs.getString(13)%>"> *</td>
        <td height="35" align="right"><span class="STYLE1">ѧ��:</span></td>
        <td><select name="newempeducation" size="1">
        	<option value="<%= empeducation%>" selected><%=empeducation %></option>
        	<%
        	String [] emp_education = new String [7];
        	emp_education[0]="����";
        	emp_education[1]="����";
        	emp_education[2]="��ר";
        	emp_education[3]="ר��";
        	emp_education[4]="����";
        	emp_education[5]="˶ʿ";
        	emp_education[6]="��ʿ";
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
        <td height="35" align="right"> <span class="STYLE1">��������:</span></td>
        <td><select name="newempforeign" size="1">
        	<option value="<%= empforeign%>" selected><%=empforeign %></option>
        	<%
        	String [] emp_foreign = new String [8];
        	emp_foreign[0]="Ӣ��";
        	emp_foreign[1]="����";
        	emp_foreign[2]="����";
        	emp_foreign[3]="����";
        	emp_foreign[4]="����";
        	emp_foreign[5]="��������";
        	emp_foreign[6]="��������";
        	emp_foreign[7]="����";
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
        <td align="right"><span class="STYLE1">����ˮƽ:</span></td>
        <td><select name="newemplever" size="1">
        	<option value="<%= emplever%>" selected><%=emplever %></option>
        	<%
        	String [] emp_lever = new String [4];
        	emp_lever[0]="����";
        	emp_lever[1]="�ļ�";
        	emp_lever[2]="����";
        	emp_lever[3]="�˼�";
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
        <td height="35" align="right"><span class="STYLE1">��ϵ�绰:</span></td>
        <td><input name="newemptel" type="text" class="data" size="13" maxlength="13" value="<%=rs.getString(17)%>">&nbsp;*</td>
        <td align="right"><span class="STYLE1">����:</span></td>
        <td><input name="newempemail" type="text" size="25" maxlength="30" value="<%=rs.getString(18)%>"></td>
      </tr>
      
      <tr>
      	<td height="35" align="right"><span class="STYLE1">��ͥסַ:</span></td>
        <td><input name="newempaddress" type="text" size="20" value="<%=rs.getString(19)%>"></td>
        <td align="center" align="right" valign="middle"><span class="STYLE1">��ְʱ��:</span></td>
    	<td align="left" valign="middle"><input name="newempaddtime" type="text" size="20" value="<%=rs.getString(20)%>"/>
        </td>
      </tr>
      
      <tr>
        <td height="49" colspan="4" align="center">
          <input type="hidden" name="empid" value="<%=empid%>">
          <input type="submit" name="submit" value="�޸�">
          <input type="reset" name="reset" value="����">
          <input type="button" value="����" onclick="javascript:history.back();">
        </td>
      </tr>
	</table>	
</form>    
	<%
	rs.close();
	}catch(Exception e){
		System.out.println("Ա����Ϣ�޸Ĵ��󣬴�����Ϣ��"+e.getMessage());
	}
	db.close();
  %> 
  </body>
</html>
