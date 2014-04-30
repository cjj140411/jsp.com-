<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import= "java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
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
<script language="javascript">
function formsubmit()
{
	alert("数据保存成功，详细数据可转到查询去查看");
	form1.submit();
	form2.submit();
}
</script>
<%
Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
Statement stmt=cn.createStatement();
%>
<script language="javascript" type="text/javascript" src="WdatePicker.js"></script>
<form action="addcus.jsp" method="post" name="form1" >
<p align="center"><font size="7"> 新增客户资料</font></p>
<table width="1515" border="2">
  <tr>
  <td width="45" height="44"><div align="center">序号</div></td>
    <td width="140" height="44"><div align="center">旺旺名称</div></td>
    <td width="140"><div align="center">客户名称</div></td>
    <td width="280"><div align="center">客户地址</div></td>
    <td width="140"><div align="center">客户电话</div></td>
    <td width="63"><div align="center">快递</div></td>
    <td width="75"><div align="center">重量(公斤)</div></td>
    <td width="72"><div align="center">运费</div></td>
    <td width="111"><div align="center">购买方式</div></td>
    <td width="55"><div align="center">购买店铺</div></td>
    <td width="105"><div align="center">购买日期</div></td>
    <td width="217"><div align="center">备注</div></td>
  </tr>
  <tr>
    <%
  for(int i=1;i<=10;i++)
  {
  %>
<td><div align="center"><%=i%></div></td>
    <td width="140"><div align="center">
      <label for="textfield"></label>
      <input name=<%="wwmc"+i%> type="text" id="textfield" size="20" maxlength="20"/>
    </div></td>
    <td>
      <div align="center">
        <input name=<%="cname"+i%> type="text" id="textfield2" size="20" maxlength="10" />
      </div></td>
    <td>
      <div align="center">
        <input name=<%="caddress"+i%>
       type="text" id="textfield3" size="40" maxlength="50" />
      </div></td>
    <td><label for="textfield4"></label>
      <div align="center">
        <input name=<%="cphone"+i%> type="text" id="textfield4" size="20" maxlength="20" />
      </div></td>
    <td><label for="select"></label>
      <div align="center">
        <select name=<%="ckd"+i%> id="select">
        <option value="" selected="selected"></option>
          <%
	  String sql="select kdname from kd";
	  ResultSet rs=stmt.executeQuery(sql);
	  String kd[]={""};
	  while(rs.next())
	  {
		  int j=0;
		  kd[j]=rs.getString(1);
	  
	   %>
<option value=<%=kd[j]%>><%=kd[j]%></option>
          <%
		j++;
		}
		%>
        </select>
      </div></td>
    <td><label for="select2"></label>
      <div align="center">
        <select name=<%="kg"+i%> id="select2">
        <option value="" selected="selected"></option>
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
        <input name=<%="fy"+i%> type="text" id="textfield5" size="10" maxlength="3" />
      </div></td>
    <td><label for="select3"></label>
      <div align="center">
        <select name=<%="cg"+i%> id="select3">
        <option value="" selected="selected"></option>
          <option value="线上">线上</option>
          <option value="冲单">冲单</option>
        </select>
      </div></td>
    <td><div align="center">
      <label for="select4"></label>
      <select name=<%="netshop"+i%> id="select4">
      <option value="" selected="selected"></option>
        <%
	  String sql1="select netshop from netshop";
	  rs=stmt.executeQuery(sql1);
	  while(rs.next()){
		  int x=0;
		  String netshop[]={""};
		  netshop[x]=rs.getString(1);
	  %>
        <option value=<%=netshop[x]%>><%=netshop[x]%></option>
        <%
	  x++;
	  }
	  %>
      </select>
    </div></td>
    <td><label for="textfield6"></label>
      <div align="center">
        <input name=<%="buydate"+i%> type="text" id="textfield6" onclick="WdatePicker()" size="15"/>
      </div></td>
    <td><label for="textfield7"></label>
      <div align="center">
        <input name=<%="beizhu"+i%> type="text" id="textfield7" value="" size="30" maxlength="255" />
      </div></td>
  </tr>
  <%}%>
</table>
<div align="center">
  <input name="按钮" type="button" value="提交" onclick="formsubmit()" />
  <input name="" type="reset" value="取消" /><a href="selectcus.jsp?selectpage=1&select=0" target="_blank">转到查询</a>
</div>
</form>
<%if(request.getMethod()=="POST")
{
	String wwmc="";
	String cname="";
	String caddress="";
	String cphone="";
	String ckd="";
	String kg="";
	String fy="";
	String cg="";
	String netshop="";
	String buydate="";
	String beizhu="";
	request.setCharacterEncoding("gb2312");
	try{
		for(int i=1;i<=10;i++)
		{
			wwmc=request.getParameter("wwmc"+i);
			cname=request.getParameter("cname"+i);
			caddress=request.getParameter("caddress"+i);
			cphone=request.getParameter("cphone"+i);
			ckd=request.getParameter("ckd"+i);
			kg=request.getParameter("kg"+i);
			fy=request.getParameter("fy"+i);
			cg=request.getParameter("cg"+i);
			netshop=request.getParameter("netshop"+i);
			buydate=request.getParameter("buydate"+i);
			beizhu=request.getParameter("beizhu"+i);
			if(wwmc.length()>0|| cname.length()>0|| caddress.length()>0|| cphone.length()>0||ckd.length()>0||kg.length()>0||fy.length()>0||cg.length()>0||netshop.length()>0||buydate.length()>0||beizhu.length()>0)
			{
				String sql="insert into listcus values("+"'"+wwmc+"'"+","+"'"+cname+"'"+","+"'"+caddress+"'"+","+"'"+cphone+"'"+","+"'"+ckd+"'"+","+"'"+kg+"'"+","+"'"+fy+"'"+","+"'"+cg+"'"+","+"'"+netshop+"'"+","+"'"+buydate+"'"+","+"'"+beizhu+"'"+")";
				stmt.executeUpdate(sql);
%>				
	

<%}
			else i++;
		}
	}
	catch(Exception e)
	{}
	try{
		int count=0;
		for(int j=1;j<=10;j++)
		{
			wwmc=request.getParameter("wwmc"+j);
			cname=request.getParameter("cname"+j);
			caddress=request.getParameter("caddress"+j);
			cphone=request.getParameter("cphone"+j);
			netshop=request.getParameter("netshop"+j);
			if(wwmc.length()>0||cname.length()>0||caddress.length()>0||cphone.length()>0||netshop.length()>0)
			{
				String sql1="select count(*) from listcus where wwmc="+"'"+wwmc+"'"+"and cname="+"'"+cname+"'"+"and caddress="+"'"+caddress+"'"+"and cphone="+"'"+cphone+"'"+"and netshop="+"'"+netshop+"'";
				ResultSet rs=stmt.executeQuery(sql1);
				while(rs.next()){
					count=rs.getInt(1);
				}
					if(count==1)
					{
						String sql2="insert into cus values("+"'"+wwmc+"'"+","+"'"+cname+"'"+","+"'"+caddress+"'"+","+"'"+cphone+"'"+","+"'"+netshop+"'"+","+count+")";
						stmt.executeUpdate(sql2);
					}
						else if(count>1)
						{
							String sql2="update cus set ccount="+count+"\t"+"where wwmc="+"'"+wwmc+"'"+"and cname="+"'"+cname+"'"+"and caddress="+"'"+caddress+"'"+"and cphone="+"'"+cphone+"'"+"and netshop="+"'"+netshop+"'";
							
							stmt.executeUpdate(sql2);
						}
				}
				else j++;
			}
			
		}
	catch(Exception e)
	{}
}
%>
</body>
</html>