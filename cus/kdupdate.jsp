<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<%
Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
Statement stmt=cn.createStatement();
String sql="";
ResultSet rs;
%>
<script language="javascript">
function confirmupdate()
{
	if(confirm("确定修改快递名称?")==true)
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
<div align="center"><strong>快递修改</strong></div>
<form action="kdupdate.jsp" method="post" name="form1">
<table width="391" border="1" align="center">
  <tr>
    <td width="95">旧快递名称</td>
    <%
	while(rs.next())
	{
		kdname=rs.getString(1);
	%>
    <td width="136"><%=kdname%></td>
    <%}%>
  </tr>
  <tr>
    <td>新快递名称</td>
    <td><label for="textfield"></label>
      <input type="text" name="updatekd" id="textfield" /></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <input type="button"  value="修改" onclick="return confirmupdate()"/>
      <input type="submit" name="button" id="button" value="提交" />
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
快递名称修改完成，请按关闭窗口键关闭本页面
<p><input type="button" value="关闭窗口"  onclick="javascript:window.close()"/></p>
</div>
<%
}
%>
</body>
</html>