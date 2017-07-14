<%-- 
    Document   : frm_BusType
    Created on : Jul 11, 2017, 2:16:22 PM
    Author     : sisira
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="ksrtc.Connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id="";
    String name="";
    String minimum="";
    String edtid="";
    String hid="";
    String delid="";
    edtid=request.getParameter("edt");
    delid=request.getParameter("del");
    
    if(delid!=null)
    {
        String delt="delete from tbl_bus_type where bus_type_id='"+delid+"'";
       // out.println(delt);
        obj.executeCommand(delt);
       response.sendRedirect("frm_BusType.jsp?delmsg=success");
    }
    if(edtid!=null)
    {
        String sel="select * from tbl_bus_type where bus_type_id='"+edtid+"'";
        ResultSet rs=obj.selectCommand(sel);
        while(rs.next())
        {
            name=rs.getString("bus_type_name");
            minimum=rs.getString("bus_type_minamnt");
            id=rs.getString("bus_type_id");
        }
    }
    
    
    if(request.getParameter("btSub")!=null)
    {
        name=request.getParameter("txtname");
        minimum=request.getParameter("txtmin");
        hid=request.getParameter("hidno");
        if(hid!="")
        {
            String updt="update tbl_bus_type set bus_type_name='"+name+"',bus_type_minamnt='"+minimum+"' where bus_type_id='"+hid+"'";
            obj.executeCommand(updt);
            response.sendRedirect("frm_BusType.jsp?upmsg=success");
        }
        else
        {
            String ins="insert into tbl_bus_type (bus_type_name,bus_type_minamnt) values ('"+name+"','"+minimum+"')";
            //out.println(ins);
            obj.executeCommand(ins);
            response.sendRedirect("frm_BusType.jsp?inmsg=success");
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
        <form name="frm_BusType">
        <h1>Bus Type</h1>
        <table>
             <input type="hidden" name="hidno" value="<%=id%>"
            <tr>
                <td>Type</td>
                <td><input type="text" name="txtname" value="<%=name%>" required="required"></td>
            </tr>
             <tr>
                <td>Minimum charge</td>
                <td><input type="text" name="txtmin" value="<%=minimum%>" required="required"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btSub" value="Add">
                    <input type="reset" name="btCancel" value="Cancel"></td>
       
            </tr>
        </table>
        
<table border="1" cellpadding="">  
    <th>Bus Type</th>
    <th>Minimum Charge</th>
<%
        String sel="select * from tbl_bus_type";
        ResultSet rs=obj.selectCommand(sel);
        while(rs.next())
        {
%>  
<tr>
    <td><%=rs.getString("bus_type_name")%></td>
    <td><%=rs.getString("bus_type_minamnt")%></td>
    <td><a href="frm_BusType.jsp?edt=<%=rs.getString("bus_type_id")%>">Edit</a></td>
    <td><a href="frm_BusType.jsp?del=<%=rs.getString("bus_type_id")%>">Delete</a></td>
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