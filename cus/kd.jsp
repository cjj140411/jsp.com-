<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META http-equiv="content-type" content="text/html;charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
body,td,th {
	font-size: 24px;
}
</style>
</head>

<body>
<div align="center"><strong>新建快递 </strong></div>
<p>


</p>
<p>


</p>
<script language="javascript">
function check()
{
	if(form1.kd.value=="")
	alert("请输入快递名称");
	else
	{
		alert("输入成功");
		form1.submit();
	}
}
</script>
<form action="kd.jsp" method="post" id="form1" nama="form1">
<table width="348" border="1" align="center">
  <tr>
    <td width="124" height="72">快递名称：</td>
    <td width="208"><input name="kd" size="20" tyte="text",/></td>
  </tr>
  <tr align="center" valign="middle">
    <td height="74" colspan="2">  <input type="button" name="button" id="button" value="提交" onclick="check()"/>
      <input type="reset" name="button2" id="button2" value="重置" /></td>
    </tr>
</table>

</form>
<div align="center">
  <%
if(request.getMethod()=="POST")
{
	request.setCharacterEncoding("gb2312");
	String kd=request.getParameter("kd");
	Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
	Statement stmt=cn.createStatement();
	String sql="insert into kd(kdname) values("+"'"+kd+"'"+")";
	stmt.executeUpdate(sql);
	stmt.close();
	cn.close();
}
%>
  <a href="index.html"> 回到主页</a> </div>
</body>
</html>