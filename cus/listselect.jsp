<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<%
Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
Statement stmt=cn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
String sql="";
ResultSet rs;
int choosepage=0;
String select="";
String con="";
%>
</head>

<body>
<form action="listselect.jsp" method="get">
  
  <div align="center">查询条件
    <select name="select">
      <option value="0" selected="selected">全部</option>
      <option value="1">旺旺名称</option>
      <option value="2">客户名称</option>
      <option value="3">客户地址</option>
      <option value="4">客户电话</option>
      <option value="5">购买店铺</option>
    </select>
  <input name="con" type="text" size="20" maxlength="20" />
  <input name="" type="submit" value="提交" />
  </div>
</form>
<div align="center"><strong>客户详细资料查询</strong></div>

<%
request.setCharacterEncoding("gb2312");
try{
String selectpage=request.getParameter("selectpage");
select=request.getParameter("select");
con=request.getParameter("con");
int cho=Integer.parseInt(select);
if(select.matches("0"))
{
	sql="select * from listcus ORDER BY buydate DESC";
}
else
{
	switch(cho)
	{
		case 0:
		sql="select * from listcus ORDER BY buydate DESC";
		break;
		case 1:
		sql="select * from listcus where wwmc like '%"+con+"%'"+"ORDER BY buydate DESC";
		break;
		case 2:
		sql="select * from listcus where cname like '%"+con+"%'"+"ORDER BY buydate DESC";
		break;
		case 3:
		sql="select * from listcus where caddress like '%"+con+"%'"+"ORDER BY buydate DESC";
		break;
		case 4:
		sql="select * from listcus where cphone like"+"'%"+con+"%'"+"ORDER BY buydate DESC";
		break;
		case 5:
		sql="select * from listcus where netshop like"+"'%"+con+"%'"+"ORDER BY buydate DESC";
		break;
		
	}
}
choosepage=Integer.parseInt(selectpage);
}
catch(Exception e)
{}
rs=stmt.executeQuery(sql);
int rscount=0;
int pagesize=10;
int startpage=0;
int endpage=0;
int countpage=0;
rs.last();
rscount=rs.getRow();
rs.first();
if(rscount%pagesize==0)
{
	countpage=rscount/pagesize;
}
else
{
	countpage=rscount/pagesize+1;
}
if(rscount<=pagesize)
{
	startpage=1;
	endpage=rscount;
}
else if(choosepage==1)
{
	startpage=1;
	endpage=choosepage*pagesize;
}
else if(choosepage>1)
{
	if(rscount-choosepage*pagesize<=10&&choosepage==countpage)
	{
		startpage=choosepage*pagesize-9;
		endpage=rscount;
	}
	else
	{
	startpage=choosepage*pagesize-9;
	endpage=choosepage*pagesize;
	}
}
%>
<table width="1338" border="1">
  <tr>
    <td width="45"><div align="center">序号</div></td>
    <td width="74"><div align="center">旺旺名称</div></td>
    <td width="87"><div align="center">客户名称</div></td>
    <td width="205"><div align="center">客户地址</div></td>
    <td width="110"><div align="center">客户电话</div></td>
    <td width="78"><div align="center">选择快递</div></td>
    <td width="67"><div align="center">重量</div></td>
    <td width="76"><div align="center">运费</div></td>
    <td width="99"><div align="center">购买方式</div></td>
    <td width="92"><div align="center">购买店铺</div></td>
    <td width="112"><div align="center">购买日期</div></td>
    <td width="217"><div align="center">备注</div></td>
  </tr>
  <%
  int sum=0;
  for(int i=startpage;i<=endpage;i++)
  {
	  if(i>rscount) break;
	 rs.absolute(i);
	 sum++;
	  String wwmc=rs.getString(1);
	  String cname=rs.getString(2);
	  String caddress=rs.getString(3);
	  String cphone=rs.getString(4);
	  String ckd=rs.getString(5);
	  String kg=rs.getString(6);
	  String fy=rs.getString(7);
	  String cg=rs.getString(8);
	  String netshop=rs.getString(9);
	  String buydate=rs.getString(10);
	  String beizhu=rs.getString(11);
  %>
  <tr>
    <td><div align="center"><%=i%></div></td>
    <td><div align="center"><%=wwmc%></div></td>
    <td><div align="center"><%=cname%></div></td>
    <td><div align="center"><%=caddress%></div></td>
    <td><div align="center"><%=cphone%></div></td>
    <%
	if(ckd.length()==0)
	{
	%>
    <td>&nbsp;</td>
    <%}
	else
	{
	%>
    <td><div align="center"><%=ckd%></div></td>
    <%}%>
    <%
	if(kg.length()==0)
	{
	%>
    <td>&nbsp;</td>
    <%}
	else
	{%>
    <td><div align="center"><%=kg%></div></td>
    <%}%>
    <%
	if(fy.length()==0)
	{
	%>
    <td>&nbsp;</td>
    <%}
	else{
	%>
    <td><div align="center"><%=fy%></div></td>
    <%}%>
    <%
	if(cg.length()==0)
	{
	%>
    <td>&nbsp;</td>
    <%}
	else
	{
	%>
    <td><div align="center"><%=cg%></div></td>
    <%}%>
    <td><div align="center"><%=netshop%></div></td>
    <td><div align="center"><%=buydate%></div></td>
    <%
	if(beizhu.length()==0)
	{
	%>
    <td>&nbsp;</td>
    <%}
	else{
	%>
    <td><div align="center"><%=beizhu%></div></td>
    <%}%>
  </tr>
  <%}%>
</table>
<div align="center">
<%out.println("本页共"+sum+"条记录,共"+rscount+"条记录");%>
<%
int pagecount=0;
pagecount=rscount/pagesize;
if(rscount<=pagesize)
{
	pagecount=1;
}
else if(rscount%10!=0)
{
	pagecount++;
}
else if(rscount%10==0)
{
	pagecount=rscount/pagesize;
}
%>
第
<%
for(int i=1;i<=pagecount;i++)
{
%>
<a href="listselect.jsp?selectpage=<%=i%>&select=<%=select%>&con=<%=con%>"><%=i%></a>
<%}%>
页
</div>
</body>
</html>