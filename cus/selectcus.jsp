<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
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
    <option value="0" selected="selected">ȫ��</option>
    <option value="1">��������</option>
    <option value="2">�ͻ�����</option>
    <option value="3">�ͻ���ַ</option>
    <option value="4">�ͻ��绰</option>
    <option value="5">�������</option>
  </select>
  <input name="con" type="text" id="con" size="20" maxlength="20" /><input type="submit" value="��ѯ" />
  </div>
</form>
<h1 align="center"><strong>�ͻ����ϲ�ѯ</strong></h1>
<table width="1159" border="1" align="center">
  <tr>
  <td width="48">���</td>
    <td width="113">��������</td>
    <td width="126">�ͻ�����</td>
    <td width="289">�ͻ���ַ</td>
    <td width="161">�ͻ��绰</td>
    <td width="135">�������</td>
    <td width="118">�������</td>
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
  int pagesize=10;//ÿҳ��¼��
  int rscount=0;//���ݿ��¼��
  int startpage=0;//ÿҳ��ͷ
  int endpage=0;//ÿҳ����
  rs.last();
  rscount=rs.getRow();
  rs.first();
 if(rscount<=pagesize)//�����¼��С��ÿҳ��¼��������
 {
	 startpage=1;     //��ʼ��¼����1���������ڼ�¼��
	 endpage=rscount;
 }
 else if(selectpage==1)//�����ҳѡ���1ҳ������
 {
	 startpage=1; //��ʼ��¼���ڵ�һ����¼���������ڵ�ǰҳ������ÿҳ��¼��
	 endpage=selectpage*pagesize;
 }
 else if(selectpage>1)//�����ҳѡ���ǵ�һҳ����������ʼ����ѡ��ҳ������ÿҳ��¼����9����������ѡ��ҳ������ÿҳ��¼��
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
    <td><a href="listselectcus.jsp?wwmc=<%=wwmc%>&cname=<%=cname%>&caddress=<%=caddress%>&cphone=<%=cphone%>&netshop=<%=netshop%>&ccount=<%=ccount%>" target="_blank">��ϸ��Ϣ</a></td>
  </tr>
  <%}%>
</table>
<div align="center">
  <%
int pagecount=0;//��ҳ������
int calcpagecount=0;//��ҳ��������ʱ����
calcpagecount=rscount/10;
if(rscount<=10)  //�Զ������ҳ���������¼��С��10����ҳ������1�������¼�����಻����0����ҳ����1�������ҳ�������ռ�¼������10����
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
  <%out.println("��"+rscount+"����¼");%>
</p>
</div>
</body>
</html>