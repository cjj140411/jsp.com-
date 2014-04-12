<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import= "java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<%
Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
Statement stmt=cn.createStatement();
%>
<script language="javascript" type="text/javascript" src="WdatePicker.js"></script>
<form action="addcus.jsp" method="post" name="form1" >
<p align="center"><font size="7"> 新增客户资料</font></p>
<table width="1644" border="2">
  <tr>
  <td width="56" height="44"><div align="center">序号</div></td>
    <td width="214" height="44"><div align="center">旺旺名称</div></td>
    <td width="168"><div align="center">客户名称</div></td>
    <td width="168"><div align="center">客户地址</div></td>
    <td width="168"><div align="center">客户电话</div></td>
    <td width="50"><div align="center">快递</div></td>
    <td width="60"><div align="center">重量（公斤）</div></td>
    <td width="168"><div align="center">运费</div></td>
    <td width="76"><div align="center">购买方式</div></td>
    <td width="86"><div align="center">购买店铺</div></td>
    <td width="175"><div align="center">购买日期</div></td>
    <td width="177"><div align="center">备注</div></td>
  </tr>
  <tr>
  <%
  for(int i=1;i<=10;i++)
  {
  %>
  <td><div align="center"><%=i%></div></td>
    <td><div align="center">
      <input name=<%="wwmc"+i%> type="text" id="textfield" maxlength="20" />
    </div></td>
    <td>
      <div align="center">
        <input name="cname" type="text" id="textfield2" maxlength="10" />
      </div></td>
    <td>
      <div align="center">
        <input name="caddress
      " type="text" id="textfield3" maxlength="50" />
      </div></td>
    <td><label for="textfield4"></label>
      <div align="center">
        <input name="cphone" type="text" id="textfield4" maxlength="13" />
      </div></td>
    <td><label for="select"></label>
      <div align="center">
        <select name=<%="kd"+i%> id="select">
          <%
	  String sql="select kdname from kd";
	  ResultSet rs=stmt.executeQuery(sql);
	  String kd[]={""};
	  while(rs.next())
	  {
		  int j=0;
		  kd[j]=rs.getString(1);
	  
	   %>  
          <option value=<%=kd[j]%> selected="selected"><%=kd[j]%></option>
          <%
		j++;
		}
		%>
        </select>
      </div></td>
    <td><label for="select2"></label>
      <div align="center">
        <select name=<%="kg"+i%> id="select2">
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
      </div></td>
    <td><label for="textfield5"></label>
      <div align="center">
        <input name="fy" type="text" id="textfield5" maxlength="3" />
      </div></td>
    <td><label for="select3"></label>
      <div align="center">
        <select name=<%="cg"+i%> id="select3">
          <option value="线上" selected="selected">线上</option>
          <option value="线下">线下</option>
          <option value="冲单">冲单</option>
        </select>
      </div></td>
    <td><div align="center"></div></td>
    <td><label for="textfield6"></label>
      <div align="center">
        <input type="text" name="buydate" id="textfield6" onclick="WdatePicker()"/>
      </div></td>
    <td><label for="textfield7"></label>
      <div align="center">
        <input name="beizhu" type="text" id="textfield7" value="" maxlength="255" />
      </div></td>
  </tr>
  <%}%>
</table>
</form>
</body>
</html>