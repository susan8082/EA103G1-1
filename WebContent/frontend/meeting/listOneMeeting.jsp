<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.meeting.model.*"%>
<%@ page import="com.reg_inf.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.wel_record.model.*"%>
<%@ page import=" java.text.*,  java.util.*"  %>


<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	MeetingVO meetingVO = (MeetingVO) request.getAttribute("meetingVO"); //EmpServlet.java(Concroller), 存入req的empVO物件

	WelRecordVO welRecordVO = (WelRecordVO) request.getAttribute("welRecordVO");

	MemVO memVO = (MemVO) session.getAttribute("memVO");
	
%>

<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 Date current = new Date();
%>
<html>
<head>

<title>員工資料 - listOneMeeting.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 900px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>
<span id="time"></span>


<table id="table-1">
	<tr><td>
		 <h3>見面會資料 - ListOneMeeting.jsp</h3>
		 <h4><a href="/EA103G1/frontend/meeting/listAllMeeting_front.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>見面會名稱</th>
		<td>${meetingVO.mt_id}</td>
	</tr>	
		
	<tr>
		<th>會員ID</th>
		<td>${meetingVO.mem_id}</td>
	</tr>
	
	<tr>
		<th>人數上限</th>
		<td>${meetingVO.max_num}</td>
	</tr>
		
	<tr>
		<th>人數下限</th>
		<td>${meetingVO.min_num}</td>
	</tr>
	
	<tr>
		<th>地點</th>
		<td>${meetingVO.mt_place}</td>
	</tr>
	
	<tr>
		<th>報名費</th>
		<td>${meetingVO.ri_fee}</td>
	</tr>
	
	<tr>
		<th>活動簡介</th>
		<td>${meetingVO.mt_detail}</td>
	</tr>
	
	<tr>
		<th>報名開始時間</th>
		<td>${meetingVO.mt_start_time}</td> 
	</tr>
	
	<tr>
		<th>報名截止時間</th>
		<td>${meetingVO.mt_end_time}</td> 
	</tr>
	
	<tr>
		<th>活動時間</th>
		<td>${meetingVO.mt_time}</td>
	</tr>
	

	<c:if test="${meetingVO.mt_num != null}">
	<tr>
		<th>目前人數</th>
		<td>${meetingVO.mt_num}</td>
	</tr>
	</c:if>
	<tr>
		<th>報名</th>
		<td>
			    
<%-- 以下測試時間 --%>
<fmt:formatDate value="<%=current %>" pattern="yyyy-MM-dd" var="now_time" />
<fmt:formatDate value="${meetingVO.mt_start_time}" pattern="yyyy-MM-dd" var="mt_start_time" />
<fmt:formatDate value="${meetingVO.mt_time}" pattern="yyyy-MM-dd" var="mt_time" />
<fmt:formatDate value="${meetingVO.mt_end_time}" pattern="yyyy-MM-dd" var="mt_end_time" />
<c:set var="mt_status" scope="session" value="${meetingVO.mt_status}"/>


<c:choose> 
  <c:when test="${mt_status == 2}">
            活動已取消
    </c:when>
    <c:when test="${now_time gt mt_time}">
             活動已結束
    </c:when>
     <c:when test="${now_time gt mt_end_time}">
    <font color=red>報名截止</font>
    </c:when>
    <c:when test="${mt_start_time gt now_time}">
              即將開放
    </c:when>
    <c:otherwise>
          <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/meeting/meeting.do" style="margin-bottom: 0px;">
		<input type="submit" value="報名">
        <input type="hidden" name="mt_no" value="${meetingVO.mt_no}"> 
        <input type="hidden" name="action"	value="getOne_For_Reg"></FORM>
    </c:otherwise>
</c:choose>   
</td>		
	</tr>
	


</table>




</body>
</html>