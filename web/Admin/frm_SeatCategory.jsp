<%-- 
    Document   : frm_SeatCategory
    Created on : Jul 11, 2017, 12:29:45 PM
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
        String delt="delete from tbl_seat_category where seat_cat_id='"+delid+"'";
       // out.println(delt);
        obj.executeCommand(delt);
       response.sendRedirect("frm_SeatCategory.jsp?delmsg=success");
    }
    if(edtid!=null)
    {
        String sel="select * from tbl_seat_category where seat_cat_id='"+edtid+"'";
        ResultSet rs=obj.selectCommand(sel);
        while(rs.next())
        {
            name=rs.getString("seat_cat_name");
            id=rs.getString("seat_cat_id");
        }
    }
    
    
    if(request.getParameter("btSub")!=null)
    {
        name=request.getParameter("txtcat");
        hid=request.getParameter("hidno");
        if(hid!="")
        {
            String updt="update tbl_seat_category set seat_cat_name='"+name+"' where seat_cat_id='"+hid+"'";
            obj.executeCommand(updt);
            response.sendRedirect("frm_SeatCategory.jsp?upmsg=success");
        }
        else
        {
            String ins="insert into tbl_seat_category (seat_cat_name) values ('"+name+"')";
            obj.executeCommand(ins);
            response.sendRedirect("frm_SeatCategory.jsp?inmsg=success");
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
        <form name="frm_SeatCategory">
        <h1>Seat Category</h1>
        <table>
             <input type="hidden" name="hidno" value="<%=id%>"
            <tr>
                <td>Name</td>
                <td><input type="text" name="txtcat" value="<%=name%>" required="required"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btSub" value="Add">
                    <input type="reset" name="btCancel" value="Cancel"></td>
       
            </tr>
        </table>
        
<table border="1" cellpadding="">  
<%
        String sel="select * from tbl_seat_category";
        ResultSet rs=obj.selectCommand(sel);
        while(rs.next())
        {
%>  
<tr>
    <td><%=rs.getString("seat_cat_name")%></td>
    <td><a href="frm_SeatCategory.jsp?edt=<%=rs.getString("seat_cat_id")%>">Edit</a></td>
    <td><a href="frm_SeatCategory.jsp?del=<%=rs.getString("seat_cat_id")%>">Delete</a></td>
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