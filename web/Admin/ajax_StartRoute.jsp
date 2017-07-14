<%-- 
    Document   : ajax_StartRoute
    Created on : Jul 12, 2017, 11:48:21 AM
    Author     : sisira
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="ksrtc.Connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<select required="required">
    <option value="">--select--</option>
<%
String start_dipo=request.getParameter("start_dipo");
String sel="select * from tbl_dipo  where district_id="+start_dipo;
ResultSet rs=obj.selectCommand(sel);
while(rs.next())
{
    %>
    <option value="<%=rs.getString("dipo_id")%>"><%=rs.getString("dipo_name")%></option>
    <%
}
%>
</select>