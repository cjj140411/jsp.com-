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
String sql="select kdname from kd";
int sum=0;
ResultSet rs=stmt.executeQuery(sql);
%>
<script language="javascript" type="text/jscript" src="WdatePicker.js"></script>
<div align="center">客户资料修改 </div>
<form action="updatecus.jsp" method="post" name="form1">
<table width="396" border="1" align="center">
  <tr>
    <td width="92">旺旺名称</td>
    <td width="288"><label for="textfield"></label>
      <input type="text" name="updatewwmc" id="textfield"   value="<%=wwmc%>"/></td>
  </tr>
  <tr>
    <td>客户姓名</td>
    <td><label for="textfield2"></label>
      <input type="text" name="updatecname" id="textfield2" value="<%=cname%>" /></td>
  </tr>
  <tr>
    <td>客户地址</td>
    <td><label for="textfield3"></label>
      <input type="text" name="updatecaddress" id="textfield3"  value="<%=caddress%>"/></td>
  </tr>
  <tr>
    <td>客户电话</td>
    <td><label for="textfield4"></label>
      <input type="text" name="updatecphone" id="textfield4"  value="<%=cphone%>"/></td>
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
      <select name="kg" id="select2">
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
    <td><label for="netshop"></label>
      <select name="updatenetshop" id="select4">
      <%
	  String sql1="select netshop from netshop";
	  rs=stmt.executeQuery(sql1);
	  while(rs.next())
	  {
		  int k=0;
		  shop[k]=rs.getString(1);
	  %>
      <option value="<%=shop[k]%>"><%=shop[k]%></option>
      <%
	  k++;
	  }
	  %>
      </select>
      <%
	  if(netshop.length()>0)
	  {
	  %>
      已选购买店铺:<%=netshop%>
      <%}%>
      </td>
  </tr>
  <tr>
    <td height="26">购买日期</td>
    <td><label for="textfield9"></label>
      <input type="text" name="updatebuydate" id="textfield9" onclick="WdatePicker()" value="<%=buydate%>"/></td>
  </tr>
  <tr>
    <td height="25">备注</td>
    <td><label for="textfield10"></label>
      <input type="text" name="updatebeizhu" id="textfield10" value="<%=beizhu%>" /></td>
  </tr>
</table>
<div align="center">
  <input name="" type="button" value="修改" onclick="updateconfrm()"/>
  <input name="" type="reset"  value="取消"/>
</div>
<input type="hidden" name="wwmc" value="<%=wwmc%>" />
<input type="hidden" name="cname" vlaue="<%=cname%>" />
<input type="hidden" mame="caddress" value="<%=caddress%>" />
<input type="hidden" name="cphone" value="<%=cphone%>" />
<input type="hidden" name="ckd" value="<%=ckd%>" />
<input type="hidden" name="kg" value="<%=kg%>" />
<input type="hidden" name="fy" value="<%=fy%>" />
<input type="hidden" name="cg" value="<%=cg%>" />
<input type="hidden" name="netshop" value="<%=netshop%>" />
<input type="hidden" name="buydate" value="<%=buydate%>" />
<input type="hidden" name="beizhu" value="<%=beizhu%>" />
</form>
<%
}
if(request.getMethod()=="POST")
{
	request.setCharacterEncoding("gb2312");
	String updatewwmc=request.getParameter("updatewwmc");
	String updatecname=request.getParameter("updatecname");
	String updatecaddress=request.getParameter("updateaddress");
	String updatecphone=request.getParameter("updatecphone");
	String updateckd=request.getParameter("ckd");
	String updateckg=request.getParameter("updateckg");
	String updatefy=request.getParameter("updatefy");
	String updatecg=request.getParameter("updatecg");
	String updatenetshop=request.getParameter("updatenetshop");
	String updatebuydate=request.getParameter("updatebuydate");
	String updatebeizhu=request.getParameter("updatebeizhu");
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
	String sql="";
	if(!wwmc.matches(updatewwmc)||!cname.matches(updatecname)||!caddress.matches(updatecaddress)||cphone.matches(cphone)||netshop.matches(netshop))
	{
		
	}
}
%>
</body>
</html>