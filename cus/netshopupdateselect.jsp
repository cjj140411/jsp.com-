<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<%
Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
Statement stmt=cn.createStatement();
String sql="";
ResultSet rs;
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
<div align="center"><strong>网店查询</strong></div>
<table width="456" border="1" align="center">
  <tr>
    <td width="63">序号</td>
    <td width="173">网店名称</td>
    <td width="198">&nbsp;</td>
  </tr>
  <%
  sql="select * from netshop";
  rs=stmt.executeQuery(sql);
  int i=1;
  while(rs.next())
  {
	  String netshop=rs.getString(2);
  %>
  <tr>
    <td><%=i%></td>
    <td><%=netshop%></td>
    <td><a href="netshopupdate.jsp?netshop=<%=netshop%>" target="_new">修改名称</a></td>
  </tr>
  <%
  i++;
  }
  stmt.close();
  cn.close();
  %>
</table>
</body>
</html>