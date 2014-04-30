<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<%
Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
Statement stmt=cn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
%>
</head>
<body>
<script language="javascript" type="text/javascript">
function getconfirm()
{
	if(confirm("你是否要关闭？")==true)
	{
		window.close();
		return true;
	}
	else
	{
		return false;
	}
}
</script>
<%
String wwmc=request.getParameter("wwmc");
String cname=request.getParameter("cname");
String caddress=request.getParameter("caddress");
String cphone=request.getParameter("cphone");
String netshop=request.getParameter("netshop");
String ccount=request.getParameter("ccount");
int times=Integer.parseInt(ccount);

String sql="select * from listcus where wwmc="+"'"+wwmc+"'"+"and cname="+"'"+cname+"'"+"and caddress="+"'"+caddress+"'"+"and cphone="+"'"+cphone+"'"+"and netshop="+"'"+netshop+"'"+" ORDER BY buydate DESC";
ResultSet rs=stmt.executeQuery(sql);
%>
<div align="center">
  <strong>客户详细资料查询</strong></div>
<table width="1787" border="1" align="center">
  <tr>
  <td width="35">序号</td>
    <td width="135"><div align="center">旺旺名称</div></td>
    <td width="145"><div align="center">客户姓名</div></td>
    <td width="334"><div align="center">客户地址</div></td>
    <td width="182"><div align="center">客户电话</div></td>
    <td width="98"><div align="center">所选快递</div></td>
    <td width="100"><div align="center">重量</div></td>
    <td width="98"><div align="center">运费</div></td>
    <td width="95"><div align="center">购买方式</div></td>
    <td width="96"><div align="center">购买商店</div></td>
    <td width="123"><div align="center">购买日期</div></td>
    <td width="176"><div align="center">备注</div></td>
    <td width="88">&nbsp;</td>
  </tr>
  <tr>
  <%
  int i=1;
  while(rs.next())
  {
	 String wwmc1=rs.getString(1);
	 String cname1=rs.getString(2);
	 String caddress1=rs.getString(3);
	 String cphone1=rs.getString(4);
	 String ckd1=rs.getString(5);
	 String kg1=rs.getString(6);
	 String fy1=rs.getString(7);
	 String cg1=rs.getString(8);
	 String netshop1=rs.getString(9);
	 String buydate1=rs.getString(10);
	 String beizhu1=rs.getString(11); 
  %>
  <td><%=i%></td>
    <td><%=wwmc1%></td>
    <td><%=cname1%></td>
    <td><%=caddress1%></td>
    <td><%=cphone1%></td>
    <%
	if(ckd1.length()==0)
	{
	%>
    <td>&nbsp;</td>
    <%
	}
	else
	{
	%>
    <td><%=ckd1%></td>
    <%}%>
    <%
	if(kg1.length()==0)
	{
	%>
    <td>&nbsp;</td>
    <%
	}
	else
	{
	%>
    <td><%=kg1%></td>
    <%}%>
    <%
	if(fy1.length()==0)
	{
	%>
    <td>&nbsp;</td>
    <%
	}
	else
	{
	%>
    <td><%=fy1%></td>
    <%}%>
    <%
	if(cg1.length()==0)
	{
	%>
    <td>&nbsp;</td>
    <%
	}
	else
	{
	%>
    <td><%=cg1%></td>
    <%}%>
    <td><%=netshop1%></td>
    <td><%=buydate1%></td>
    <%
	if(beizhu1.length()==0)
	{
	%>
    <td>&nbsp;</td>
    <%
	}
	else 
	{
	%>
    <td><%=beizhu1%></td>
    <%}%>
    <td><a href="update.jsp?wwmc=<%=wwmc1%>&cname=<%=cname1%>&caddress=<%=caddress1%>&cphone=<%=cphone1%>&ckd=<%=ckd1%>&kg=<%=kg1%>&fy=<%=fy1%>&cg=<%=cg1%>&netshop=<%=netshop1%>&buydate=<%=buydate1%>&beizhu=<%=beizhu1%>" target="_blank">修改资料</a></td>
  </tr>
  <%
  i++;
  }
  %>
</table>
<div align="center">
  <input type="button" value="关闭窗口" onclick="return getconfirm()"/>
  <input name="" type="button" value="打印窗口" onclick="javascript:window.print()" />
</div>
</body>
</html>