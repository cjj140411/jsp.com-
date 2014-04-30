<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import= "java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<%
Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
Statement stmt=cn.createStatement();
ResultSet rs;
String sql="";
%>
<script language="javascript">
function updateconfrm()
{
	if(confirm("确定要修改吗")==true)
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
if(request.getMethod()=="GET")
{
request.setCharacterEncoding("gb2312");
String wwmc=request.getParameter("wwmc");
String cname=request.getParameter("cname");
String caddress=request.getParameter("caddress");
String cphone=request.getParameter("cphone");
String ckd=request.getParameter("ckd");
String kg=request.getParameter("kg");
String fy=request.getParameter("fy");
String cg=request.getParameter("cg");
String netshop=request.getParameter("netshop");
String buydate=request.getParameter("buydate");
String beizhu=request.getParameter("beizhu");
String[] kd={""};
String [] shop={""};
sql="select kdname from kd";
int sum=0;
rs=stmt.executeQuery(sql);
%>
<script language="javascript" type="text/jscript" src="WdatePicker.js"></script>
<div align="center">客户资料修改 </div>
<form action="updatecus.jsp" method="post" name="form1">
<table width="396" border="1" align="center">
  <tr>
    <td width="92">旺旺名称</td>
    <td width="288"><%=wwmc%></td>
  </tr>
  <tr>
    <td>客户姓名</td>
    <td><%=cname%></td>
  </tr>
  <tr>
    <td>客户地址</td>
    <td><%=caddress%></td>
  </tr>
  <tr>
    <td>客户电话</td>
    <td><%=cphone%></td>
  </tr>
  <tr>
    <td>所选快递</td>
    <td><label for="updatekd"></label>
    <select name="updatekd" id="select1">
      <%
	  while(rs.next())
	  {
		  int i=0;
		  kd[i]=rs.getString(1);
	  %>
      <option value="<%=kd[i]%>"><%=kd[i]%></option>
      <%}%>
      </select>
      <%
	  if(ckd.length()>0)
	  {
	  %>
      已选快递:<%=ckd%>
      <%}%>
      </td>
  </tr>
  <tr>
    <td>重量</td>
    <td><label for="select2"></label>
      <select name="updateckg" id="select2">
          <%
	  	for(int a=1;a<=10;a++)
		{
			for(double b=0;b<=0.9;b=b+0.1)
			{
				if(a+b==10.1)break;
				DecimalFormat df2 = new DecimalFormat("###.0");
				%>
          <option value=<%=df2.format(a+b)%>><%=df2.format(a+b)%></option>
          <%
			}
			
		}
		%>
        </select>
      </select>
      <%
	  if(kg.length()>0)
	  {
	  %>
      已选重量:<%=kg%>
      <%}%>
      </td>
  </tr>
  <tr>
    <td>运费</td>
    <td><label for="textfield7"></label>
      <input type="text" name="updatefy" id="textfield7"  value="<%=fy%>"/></td>
  </tr>
  <tr>
    <td>购买方式</td>
    <td><label for="cg"></label>
      <select name="updatecg" id="cg">
      <option value="线上">线上</option>
      <option value="冲单">冲单</option>
      </select>
      <%
	  if(cg.length()>0)
	  {
	  %>
      已选购买方式:<%=cg%>
      <%}%>
      </td>
  </tr>
  <tr>
    <td>购买店铺</td>
    <td><%=netshop%></td>
  </tr>
  <tr>
    <td height="26">购买日期</td>
    <td><%=buydate%></td>
  </tr>
  <tr>
    <td height="25">备注</td>
    <td><label for="textfield10"></label>
      <input type="text" name="updatebeizhu" id="textfield10" value="<%=beizhu%>" /></td>
  </tr>
</table>
<div align="center">
  <input name="" type="button" value="修改" onclick="return updateconfrm()"/>
  <input name="" type="reset"  value="取消"/>
</div>
<input type="hidden" name="wwmc" value="<%=wwmc%>" />
<input type="hidden" name="cname" value="<%=cname%>" />
<input type="hidden" name="caddress" value="<%=caddress%>" />
<input type="hidden" name="cphone" value="<%=cphone%>" />
<input type="hidden" name="netshop" value="<%=netshop%>" />
<input type="hidden" name="buydate" value="<%=buydate%>" />
<input type="hidden" name="beizhu" value="<%=beizhu%>" />
</form>
<div align="center">
  <%
}
if(request.getMethod()=="POST")
{
	request.setCharacterEncoding("gb2312");
	String updatekd=request.getParameter("updatekd");
	String updateckg=request.getParameter("updateckg");
	String updatefy=request.getParameter("updatefy");
	String updatecg=request.getParameter("updatecg");
	String updatebeizhu=request.getParameter("updatebeizhu");
	String wwmc=request.getParameter("wwmc");
	String cname=request.getParameter("cname");
	String caddress=request.getParameter("caddress");
	String cphone=request.getParameter("cphone");
	String netshop=request.getParameter("netshop");
	String buydate=request.getParameter("buydate");
	String sql="update listcus set ckd="+"'"+updatekd+"'"+" where wwmc="+"'"+wwmc+"'"+"and cname="+"'"+cname+"'"+"and caddress="+"'"+caddress+"'"+"and cphone="+"'"+cphone+"'"+"and netshop="+"'"+netshop+"'"+"and buydate="+"'"+buydate+"'";
	stmt.executeUpdate(sql);
	String sql1="update listcus set kg="+"'"+updateckg+"'"+" where wwmc="+"'"+wwmc+"'"+"and cname="+"'"+cname+"'"+" and caddress="+"'"+caddress+"'"+" and cphone="+"'"+cphone+"'"+" and netshop="+"'"+netshop+"'"+" and buydate="+"'"+buydate+"'";
	stmt.executeUpdate(sql1);
	String sql2="update listcus set fy="+"'"+updatefy+"'"+" where wwmc="+"'"+wwmc+"'"+"and cname="+"'"+cname+"'"+" and caddress="+"'"+caddress+"'"+" and cphone="+"'"+cphone+"'"+" and netshop="+"'"+netshop+"'"+" and buydate="+"'"+buydate+"'";
	stmt.executeUpdate(sql2);
	String sql3="update listcus set cg="+"'"+updatecg+"'"+" where wwmc="+"'"+wwmc+"'"+"and cname="+"'"+cname+"'"+" and caddress="+"'"+caddress+"'"+" and cphone="+"'"+cphone+"'"+" and netshop="+"'"+netshop+"'"+" and buydate="+"'"+buydate+"'";
	stmt.executeUpdate(sql3);
	String sql4="update listcus set beizhu="+"'"+updatebeizhu+"'"+" where wwmc="+"'"+wwmc+"'"+"and cname="+"'"+cname+"'"+" and caddress="+"'"+caddress+"'"+" and cphone="+"'"+cphone+"'"+" and netshop="+"'"+netshop+"'"+" and buydate="+"'"+buydate+"'";
	stmt.executeUpdate(sql4);
%>
<div align="center">	数据修改完成，修改后的结果可以再关闭本页面后刷新查询页面进行查看。
</div>
<div align="center">
<input type="button" value="关闭窗口" onclick="javascript:window.close()"/>
</div>
<%
}
%>
</div>
</body>
</html>