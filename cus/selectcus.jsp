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
<form action="selectcus.jsp" method="get">
  <div align="center">
  <select name="select">
    <option value="0" selected="selected">全部</option>
    <option value="1">旺旺名称</option>
    <option value="2">客户名称</option>
    <option value="3">客户地址</option>
    <option value="4">客户电话</option>
    <option value="5">购买店铺</option>
  </select>
  <input name="con" type="text" id="con" size="20" maxlength="20" /><input type="submit" value="查询" />
  </div>
</form>
<h1 align="center"><strong>客户资料查询</strong></h1>
<table width="1159" border="1" align="center">
  <tr>
  <td width="48">序号</td>
    <td width="113">旺旺名称</td>
    <td width="126">客户名称</td>
    <td width="289">客户地址</td>
    <td width="161">客户电话</td>
    <td width="135">购买店铺</td>
    <td width="118">购买次数</td>
    <td width="117">&nbsp;</td>
  </tr>
  <tr>
    <%
	request.setCharacterEncoding("gb2312");
  String choosepage=request.getParameter("selectpage");
  int selectpage=0;
  try{
	 String select=request.getParameter("select");
	 String con=request.getParameter("con");
	 int cho=Integer.parseInt(select);
	 if(select.matches("0"))
	 sql="select * from cus";
	 else{
		 switch(cho)
		 {
			 case 0:
			 sql="select * from cus";
			 break;
			 
			 case 1:
			 sql="select * from cus where wwmc like"+"'%"+con+"%'";
			 break;
			 
			 case 2:
			 sql="select * from cus where cname like"+"'%"+con+"%'";
			 break;
			 
			 case 3:
			 sql="select * from cus where caddress like"+"'%"+con+"%'";
			 break;
			 
			 case 4:
			 sql="select * from cus where cphone like"+"'%"+con+"%'";
			 break;
			 
			 case 5:
			 sql="select * from cus where netshop like"+"'%"+con+"%'";
			 break;
			 
		 }
	 }
	  if(choosepage.length()==0)
	  selectpage=1;
	  else selectpage=Integer.parseInt(choosepage);
  }
  catch(Exception e)
  {}
  rs=stmt.executeQuery(sql);
  int pagesize=10;//每页记录数
  int rscount=0;//数据库记录数
  int startpage=0;//每页开头
  int endpage=0;//每页结束
  rs.last();
  rscount=rs.getRow();
  rs.first();
 if(rscount<=pagesize)//如果记录数小于每页记录数处理方法
 {
	 startpage=1;     //开始记录等于1，结束等于记录数
	 endpage=rscount;
 }
 else if(selectpage==1)//如果分页选择第1页处理方法
 {
	 startpage=1; //开始记录等于第一条记录、结束等于当前页数乘以每页记录数
	 endpage=selectpage*pagesize;
 }
 else if(selectpage>1)//如果分页选择不是第一页处理方法：开始等于选择页数乘以每页记录数减9，结束等于选择页数乘以每页记录数
 {
	 startpage=selectpage*pagesize-9;
	 endpage=selectpage*pagesize;
 }
 for(int i=startpage;i<=endpage;i++)
 {
	 rs.absolute(i);
	 String wwmc=rs.getString(1);
	 String cname=rs.getString(2);
	 String caddress=rs.getString(3);
	 String cphone=rs.getString(4);
	 String netshop=rs.getString(5);
	 int ccount=rs.getInt(6);
  %>
<td ><%=i%></td>
    <td><%=wwmc%></td>
    <td><%=cname%></td>
    <td><%=caddress%></td>
    <td><%=cphone%></td>
    <td><%=netshop%></td>
    <td><%=ccount%></td>
    <td><a href="listselectcus.jsp?wwmc=<%=wwmc%>&cname=<%=cname%>&caddress=<%=caddress%>&cphone=<%=cphone%>&netshop=<%=netshop%>&ccount=<%=ccount%>" target="_blank">详细信息</a></td>
  </tr>
  <%}%>
</table>
<div align="center">
  <%
int pagecount=0;//分页数计算
int calcpagecount=0;//分页数计算临时变量
calcpagecount=rscount/10;
if(rscount<=10)  //自动计算分页数（如果记录数小于10，分页数等于1，如果记录数求余不等于0，分页数加1，否则分页数将按照记录数除以10计算
pagecount=1;
else if(calcpagecount%10!=0)
pagecount=calcpagecount+1;
else pagecount=calcpagecount;
for(int i=1;i<=pagecount;i++)
{
%>
  <a href="selectcus.jsp?selectpage=<%=i%>"><%=i%></a>
  <%}%>
<p> 
  <%out.println("共"+rscount+"条记录");%>
</p>
</div>
</body>
</html>