<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<%
Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
Statement stmt=cn.createStatement();
String sql="";
ResultSet rs;
%>
<script language="javascript">
function confirmupdate()
{
	if(confirm("ȷ���޸Ŀ������?")==true)
	{
		form1.submit();
		return true;
	}
	else
	{
		return false;
	}
}
</script>
</head>

<body>
<%
request.setCharacterEncoding("gb2312");
String kd=request.getParameter("kdname");
sql="select kdname from kd where kdname="+"'"+kd+"'";
rs=stmt.executeQuery(sql);
String kdname="";
%>
<div align="center"><strong>����޸�</strong></div>
<form action="kdupdate.jsp" method="post" name="form1">
<table width="391" border="1" align="center">
  <tr>
    <td width="95">�ɿ������</td>
    <%
	while(rs.next())
	{
		kdname=rs.getString(1);
	%>
    <td width="136"><%=kdname%></td>
    <%}%>
  </tr>
  <tr>
    <td>�¿������</td>
    <td><label for="textfield"></label>
      <input type="text" name="updatekd" id="textfield" /></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <input type="button"  value="�޸�" onclick="return confirmupdate()"/>
      <input type="submit" name="button" id="button" value="�ύ" />
    </div></td>
    </tr>
</table>
<input type="hidden" name="kd" value="<%=kd%>" />
</form>

  <%
if(request.getMethod()=="POST")
{
	request.setCharacterEncoding("gb2312");
	String oldkd=request.getParameter("kd");
	String newkd=request.getParameter("updatekd");
	sql="update kd set kdname="+"'"+newkd+"'"+"where kdname="+"'"+oldkd+"'";
	stmt.executeUpdate(sql);
%>
<div align="center">
��������޸���ɣ��밴�رմ��ڼ��رձ�ҳ��
<p><input type="button" value="�رմ���"  onclick="javascript:window.close()"/></p>
</div>
<%
}
%>
</body>
</html>