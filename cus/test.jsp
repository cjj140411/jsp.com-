<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import= "java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>

<select name="1">
<%
for(int i=1;i<=10;i++)
{
	for(double j=0;j<=0.9;j=j+0.1)
	{
		if(i+j==10.1)break;
		DecimalFormat df2 = new DecimalFormat("###.0"); 
%>
  <option value=<%=df2.format(i+j)%>><%=df2.format(i+j)%></option>
  <%
	}
}
%>
</select>
</body>
</html>