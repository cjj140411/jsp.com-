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
function update()
{
	if(confirm("ȷ���޸���������?")==true)
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
<div align="center"><strong>���������޸� </strong></div>
<form action="netshopupdate.jsp" method="post" name="form1">
<table width="313" border="1" align="center">
  <tr>
    <td width="129"><div align="center">����������</div></td>
    <%
	request.setCharacterEncoding("gb2312");
	String oldnetshop="";
	String netshop=request.getParameter("netshop");
	sql="select netshop from netshop where netshop="+"'"+netshop+"'";
	rs=stmt.executeQuery(sql);
	while(rs.next())
	{
		oldnetshop=rs.getString(1);
	%>
    <td width="177"><div align="center"><%=oldnetshop%></div></td>
    <%}%>
  </tr>
  <tr>
    <td><div align="center">����������</div></td>
    <td><label for="textfield"></label>
      <input type="text" name="newshop" id="textfield" /></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <input type="button" name="button" id="button" value="�޸�" onclick="return update()" />
      <input type="reset" name="button2" id="button2" value="����" />
    </div></td>
    </tr>
</table>
<input type="hidden" name="oldnetshop" value=<%=oldnetshop%> />
</form>

  <div align="center">
    <%
if(request.getMethod()=="POST")
{
	request.setCharacterEncoding("gb2312");
	String onetshop=request.getParameter("oldnetshop");
	String newnetshop=request.getParameter("newshop");
	sql="update netshop set netshop="+"'"+newnetshop+"'"+"where netshop="+"'"+onetshop+"'";
	stmt.executeUpdate(sql);
%>
���������޸���ɣ��밴�رմ��ڼ��رձ�ҳ��
  </div>
<p align="center"><input name="" type="button" value="�رմ���" onclick="javascript:window.close()"/></p>
<%
stmt.close();
cn.close();
}
%>

</body>
</html>