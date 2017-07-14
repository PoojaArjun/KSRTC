<%-- 
    Document   : ajax_dipoadmin_dipo
    Created on : Jul 13, 2017, 3:02:13 PM
    Author     : sisira
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="ksrtc.Connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<select>
    
<%
 String id=request.getParameter("id");
 String sel="select * from tbl_district ds,tbl_dipo d where ds.district_id=d.district_id and ds.district_id='"+id+"'";  
 ResultSet rs=obj.selectCommand(sel);
 while(rs.next())
 {
 %> 
 <option value="<%=rs.getString("dipo_id")%>"><%=rs.getString("dipo_name")%></option>
 <%
 }
%>
</select>