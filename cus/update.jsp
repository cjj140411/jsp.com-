<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import= "java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<%
Connection cn=DriverManager.getConnection("jdbc:odbc:cus");
Statement stmt=cn.createStatement();
ResultSet rs;
String sql="";
String[] kd={""};
%>
<script language="javascript">
function confirmupdate()
{
	if(confirm("ȷ���޸�����?")==true)
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
<div align="center"><strong>�ͻ������޸� </strong></div>
<%
request.setCharacterEncoding("gb2312");
String wwmc=request.getParameter("wwmc");
String cname=request.getParameter("cname");
String caddress=request.getParameter("caddress");
String cphone=request.getParameter("cphone");
String netshop=request.getParameter("netshop");
String buydate=request.getParameter("buydate");
sql="select * from listcus where wwmc="+"'"+wwmc+"'"+"and cname="+"'"+cname+"'"+"and caddress="+"'"+caddress+"'"+"and cphone="+"'"+cphone+"'"+"and netshop="+"'"+netshop+"'"+"and buydate="+"'"+buydate+"'";
rs=stmt.executeQuery(sql);
%>
<form action="update.jsp" method="post" name="form1">
<table width="443" border="1" align="center">
<%
while(rs.next())
{
	String wwmc1=rs.getString(1);
	String cname1=rs.getString(2);
	String caddress1=rs.getString(3);
	String cphone1=rs.getString(4);
	String ckd=rs.getString(5);
	String ckg=rs.getString(6);
	String fy=rs.getString(7);
	String cg=rs.getString(8);
	String netshop1=rs.getString(9);
	String buydate1=rs.getString(10);
	String beizhu=rs.getString(11);
%>
  <tr>
    <td width="138"><div align="center">��������</div></td>
    <td width="289"><div align="center"><%=wwmc1%></div></td>
  </tr>
  <tr>
    <td><div align="center">�ͻ�����</div></td>
    <td><div align="center"><%=cname1%></div></td>
  </tr>
  <tr>
    <td><div align="center">�ͻ���ַ</div></td>
    <td><div align="center"><%=caddress1%></div></td>
  </tr>
  <tr>
    <td><div align="center">�ͻ��绰</div></td>
    <td><div align="center"><%=cphone1%></div></td>
  </tr>
  <tr>
    <td><div align="center">��ѡ���</div></td>
    <td><label for="updatekd"></label>
      <div align="center">
        <select name="updatekd" id="updatekd">
        <%
		String sql1="select kdname from kd";
		rs=stmt.executeQuery(sql1);
		int i=0;
		while(rs.next())
		{
			kd[i]=rs.getString(1);
		%>
        <option value="<%=kd[i]%>"><%=kd[i]%></option>
        <%
		}
		%>
        </select>
        <%
		if(ckd.length()>0)
		{
		%>
        ��ѡ���:<%=ckd%>
        <%}%>
      </div></td>
  </tr>
  <tr>
    <td><div align="center">����</div></td>
    <td><label for="updatekg"></label>
      <div align="center">
        <select name="updatekg" id="updatekg">
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
        <%
		if(ckg.length()>0)
		{
		%>
        ��ѡ����:<%=ckg%>
        <%}%>
      </div></td>
  </tr>
  <tr>
    <td><div align="center">�˷�</div></td>
    <td><label for="textfield2"></label>
      <div align="center">
        <input type="text" name="updatefy" id="textfield2"  value=<%=fy%>>      
      </div></td>
  </tr>
  <tr>
    <td><div align="center">����ʽ</div></td>
    <td>
      <label for="updatecg"></label>
      <div align="center">
        <select name="updatecg" id="updatecg">
        <option value="����" selected="selected">����</option>
        <option value="�嵥">�嵥</option>
        </select>
        <%
		if(cg.length()>0)
		{
		%>
        ��ѡ����ʽ:<%=cg%>
        <%}%>
      </div></td>
  </tr>
  <tr>
    <td><div align="center">�������</div></td>
    <td><div align="center"><%=netshop%></div></td>
  </tr>
  <tr>
    <td><div align="center">��������</div></td>
    <td><div align="center"><%=buydate%></div></td>
  </tr>
  <tr>
    <td><div align="center">��ע</div></td>
    <td><label for="updatebeizhu"></label>
      <div align="center">
        <input type="text" name="updatebeizhu" id="updatebeizhu"  value=<%=beizhu%>>
      </div></td>
  </tr>
</table>
<div align="center">
  <input type="button" value="�޸�"  onclick="return confirmupdate()"/>
  <input name="����" type="reset" value="ȡ��" />
</div>
<input type="hidden" name="wwmc" value="<%=wwmc1%>" />
<input type="hidden" name="cname" value="<%=cname1%>" />
<input type="hidden" name="caddress" value="<%=caddress1%>" />
<input type="hidden" name="cphone" value="<%=cphone%>" />
<input type="hidden" name="netshop" value="<%=netshop%>" />
<input type="hidden" name="buydate" value="<%=buydate%>" />
</form>
<div align="center">
  <%
}
if(request.getMethod()=="POST")
{
	request.setCharacterEncoding("gb2312");
	String wwmc2=request.getParameter("wwmc");
	String cname2=request.getParameter("cname");
	String caddress2=request.getParameter("caddress");
	String cphone2=request.getParameter("cphone");
	String netshop2=request.getParameter("netshop");
	String buydate2=request.getParameter("buydate");
	
	String kd1=request.getParameter("updatekd");
	String kg1=request.getParameter("updatekg");
	String fy1=request.getParameter("updatefy");
	String cg1=request.getParameter("updatecg");
	String beizhu1=request.getParameter("updatebeizhu");
	
	String sql2="update listcus set ckd="+"'"+kd1+"'"+"where wwmc="+"'"+wwmc2+"'"+"and cname="+"'"+cname2+"'"+"and caddress="+"'"+caddress2+"'"+"and cphone="+"'"+cphone2+"'"+"and netshop="+"'"+netshop2+"'"+"and buydate="+"'"+buydate2+"'";
	stmt.executeUpdate(sql2);
	
	String sql3="update listcus set kg="+"'"+kg1+"'"+"where wwmc="+"'"+wwmc2+"'"+"and cname="+"'"+cname2+"'"+"and caddress="+"'"+caddress2+"'"+"and cphone="+"'"+cphone2+"'"+"and netshop="+"'"+netshop2+"'"+"and buydate="+"'"+buydate2+"'";
	stmt.executeUpdate(sql3);
	
	String sql4="update listcus set fy="+"'"+fy1+"'"+"where wwmc="+"'"+wwmc2+"'"+"and cname="+"'"+cname2+"'"+"and caddress="+"'"+caddress2+"'"+"and cphone="+"'"+cphone2+"'"+"and netshop="+"'"+netshop2+"'"+"and buydate="+"'"+buydate2+"'";
	stmt.executeUpdate(sql4);
	
	String sql5="update listcus set cg="+"'"+cg1+"'"+"where wwmc="+"'"+wwmc2+"'"+"and cname="+"'"+cname2+"'"+"and caddress="+"'"+caddress2+"'"+"and cphone="+"'"+cphone2+"'"+"and netshop="+"'"+netshop2+"'"+"and buydate="+"'"+buydate2+"'";
	stmt.executeUpdate(sql5);
	
	String sql6="update listcus set beizhu="+"'"+beizhu1+"'"+"where wwmc="+"'"+wwmc2+"'"+"and cname="+"'"+cname2+"'"+"and caddress="+"'"+caddress2+"'"+"and cphone="+"'"+cphone2+"'"+"and netshop="+"'"+netshop2+"'"+"and buydate="+"'"+buydate2+"'";
	stmt.executeUpdate(sql6);
%>
<p>�����޸ĳɹ����޸ĺ�Ľ�������ڹرձ�ҳ���ˢ�²�ѯҳ����в鿴��</p>
<p><input type="button" value="�رմ���" onclick="javascript:window.close()" /></p>
<%
}
%>
</div>
</body>
</html>