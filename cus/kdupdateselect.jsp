<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<%
Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
Statement stmt=cn.createStatement();
ResultSet rs;
String sql="";
%>
<style type="text/css">
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
</style>
</head>

<body>
<div align="center"><strong>快递修改查询 </strong><strong></strong></div>
<table width="261" border="1" align="center">
  <tr>
    <td width="72">序号</td>
    <td width="70">快递名称</td>
    <td width="97">&nbsp;</td>
  </tr>
  <%
  sql="select * from kd";
  rs=stmt.executeQuery(sql);
  int i=1;
  while(rs.next())
  {
	  String kdname=rs.getString(2);
  %>
  <tr>
    <td><%=i%></td>
    <td><%=kdname%></td>
    <td><a href="kdupdate.jsp?kdname=<%=kdname%>" target="_blank">修改快递名称</a></td>
  </tr>
  <%
  i++;
  }
  %>
</table>

</body>
</html>