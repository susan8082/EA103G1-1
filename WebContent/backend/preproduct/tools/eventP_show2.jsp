<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.math.*"%>
<%@ page import="com.event_p.model.*"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String EVENT_P_NO = request.getParameter("value");
//mysql連線
Class.forName("oracle.jdbc.driver.OracleDriver");
String URL="jdbc:oracle:thin:@localhost:1521:XE";
String userid = "G1";
String passwd = "123456";
Connection con = DriverManager.getConnection(URL,userid,passwd);


try{
	// 準備語句執行物件
	Statement stmt = con.createStatement();
	String sql = " SELECT * FROM EVENT_P WHERE EVENT_P_NO = "+ EVENT_P_NO;
	ResultSet rs = stmt.executeQuery(sql);
	if (rs.next()) {
	Blob b = rs.getBlob("EVENT_P_IMG");
	long size = b.length();
	//out.print(size);
	byte[] bs = b.getBytes(1, (int)size);
	response.setContentType("image/jpeg");
	OutputStream outs = response.getOutputStream();
	outs.write(bs);
	outs.flush();
	rs.close();
	}
	else {
	rs.close();
	response.sendRedirect("./error.jpg");
	}
	}
	finally{
	con.close();
	}
	%>
	