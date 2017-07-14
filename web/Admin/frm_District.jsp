<%-- 
    Document   : District.jsp
    Created on : Jul 10, 2017, 2:30:00 PM
    Author     : sisira
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="ksrtc.Connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id="";
    String name="";
    String edtid="";
    String hid="";
    String delid="";
    edtid=request.getParameter("edt");
    delid=request.getParameter("del");
    
    if(delid!=null)
    {
        String delt="delete from tbl_district where district_id='"+delid+"'";
       // out.println(delt);
        obj.executeCommand(delt);
       response.sendRedirect("frm_District.jsp?delmsg=success");
    }
    if(edtid!=null)
    {
        String sel="select * from tbl_district where district_id='"+edtid+"'";
        ResultSet rs=obj.selectCommand(sel);
        while(rs.next())
        {
            name=rs.getString("district_name");
            id=rs.getString("district_id");
        }
    }
    
    
    if(request.getParameter("btSub")!=null)
    {
        name=request.getParameter("txtname");
        hid=request.getParameter("hidno");
        if(hid!="")
        {
            String updt="update tbl_district set district_name='"+name+"' where district_id='"+hid+"'";
            obj.executeCommand(updt);
            response.sendRedirect("frm_District.jsp?upmsg=success");
        }
        else
        {
            String ins="insert into tbl_district (district_name) values ('"+name+"')";
            obj.executeCommand(ins);
            response.sendRedirect("frm_District.jsp?inmsg=success");
        }
      
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KSRTC</title>
    </head>
    <body>
    <center>
        <form name="frm_District">
        <h1>District</h1>
        <table>
             <input type="hidden" name="hidno" value="<%=id%>"
            <tr>
                <td>Name</td>
                <td><input type="text" name="txtname" value="<%=name%>" required="required"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btSub" value="Add">
                    <input type="reset" name="btCancel" value="Cancel"></td>
       
            </tr>
        </table>
        
<table border="1" cellpadding="">  
<%
        String sel="select * from tbl_district";
        ResultSet rs=obj.selectCommand(sel);
        while(rs.next())
        {
%>  
<tr>
    <td><%=rs.getString("district_name")%></td>
    <td><a href="frm_District.jsp?edt=<%=rs.getString("district_id")%>">Edit</a></td>
    <td><a href="frm_District.jsp?del=<%=rs.getString("district_id")%>">Delete</a></td>
</tr>
<%
        }
%>
</table>  
</form>
    </center>
    </body>
</html>
<%
if(request.getParameter("inmsg")!=null&&request.getParameter("inmsg").equalsIgnoreCase("success"))
{
%>
<script>alert("Inserted")</script>
<%}%>

<%
if(request.getParameter("upmsg")!=null&&request.getParameter("upmsg").equalsIgnoreCase("success"))
{
%>
<script>alert("Updated")</script>
<%}%>

<%
if(request.getParameter("delmsg")!=null && request.getParameter("delmsg").equalsIgnoreCase("success"))
{
%>
<script>alert("Deleted")</script>
<%}%>