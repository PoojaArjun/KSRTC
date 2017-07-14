<%-- 
    Document   : frm_WalletType
    Created on : Jul 11, 2017, 3:22:59 PM
    Author     : sisira
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="ksrtc.Connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id="";
    String name="";
    String amount="";
    String edtid="";
    String hid="";
    String delid="";
    edtid=request.getParameter("edt");
    delid=request.getParameter("del");
    
    if(delid!=null)
    {
        String delt="delete from tbl_wallet_type where wallet_type_id='"+delid+"'";
       // out.println(delt);
        obj.executeCommand(delt);
       response.sendRedirect("frm_WalletType.jsp?delmsg=success");
    }
    if(edtid!=null)
    {
        String sel="select * from tbl_wallet_type where wallet_type_id='"+edtid+"'";
        ResultSet rs=obj.selectCommand(sel);
        while(rs.next())
        {
            amount=rs.getString("wallet_amount");
            name=rs.getString("wallet_priority");
            id=rs.getString("wallet_type_id");
        }
    }
    
    
    if(request.getParameter("btSub")!=null)
    {
        name=request.getParameter("txtname");
        amount=request.getParameter("txtamount");
        hid=request.getParameter("hidno");
        if(hid!="")
        {
            String updt="update tbl_wallet_type set wallet_priority='"+name+"',wallet_amount='"+amount+"' where wallet_type_id='"+hid+"'";
            obj.executeCommand(updt);
            response.sendRedirect("frm_WalletType.jsp?upmsg=success");
        }
        else
        {
            String ins="insert into tbl_wallet_type (wallet_priority,wallet_amount) values ('"+name+"','"+amount+"')";
            
            boolean b=obj.executeCommand(ins);
            if(b)
            response.sendRedirect("frm_WalletType.jsp?inmsg=success");
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
        <form name="frm_WaletType">
        <h1>Wallet Type</h1>
        <table>
             <input type="hidden" name="hidno" value="<%=id%>"
            <tr>
                <td>Name</td>
                <td><input type="text" name="txtname" value="<%=name%>" required="required"></td>
            </tr>
             <tr>
                <td>Amount</td>
                <td><input type="text" name="txtamount" value="<%=amount%>" required="required"></td>
             </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btSub" value="Add">
                    <input type="reset" name="btCancel" value="Cancel"></td>
       
            </tr>
        </table>
            </center>

<table border="1" cellpadding=""> 
    <th>Priority</th>
    <th>Amount</th>
<%
        String sel="select * from tbl_wallet_type";
        ResultSet rs=obj.selectCommand(sel);
        while(rs.next())
        {
%>  
<tr>
    <td><%=rs.getString("wallet_priority")%></td>
    <td><%=rs.getString("wallet_amount")%></td>
    <td><a href="frm_WalletType.jsp?edt=<%=rs.getString("wallet_type_id")%>">Edit</a></td>
    <td><a href="frm_WalletType.jsp?del=<%=rs.getString("wallet_type_id")%>">Delete</a></td>
</tr>
<%
        }
%>
</table>  
</form>
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