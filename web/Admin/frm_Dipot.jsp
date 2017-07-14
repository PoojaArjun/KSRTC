<%-- 
    Document   : frm_Dipot
    Created on : Jul 11, 2017, 10:50:02 AM
    Author     : sisira
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="ksrtc.Connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id="";
    String edtid="";
    String hid="";
    String delid="";
    edtid=request.getParameter("edt");
    delid=request.getParameter("del");
    
   
    String district="";
    String dipo="";
    
    if(delid!=null)
    {
        String delt="delete from tbl_dipo where dipo_id='"+delid+"'";
        obj.executeCommand(delt);
        response.sendRedirect("frm_Dipot.jsp?delmsg=success");
    }
    
    if(edtid!=null)
    {
        String sel="select * from tbl_dipo where dipo_id='"+edtid+"'";
        ResultSet rs=obj.selectCommand(sel);
        while(rs.next())
        {
            id=rs.getString("dipo_id");
            dipo=rs.getString("dipo_name");
            district=rs.getString("district_id");
        }
    }
    
    if(request.getParameter("btSub")!=null)
    {
        district=request.getParameter("drpDist");
        dipo=request.getParameter("txtdipot");
        hid=request.getParameter("hidno");
        if(hid!="")
        {
            String  updt="update tbl_dipo set dipo_name='"+dipo+"',district_id='"+district+"' where dipo_id='"+hid+"'";
            obj.executeCommand(updt);
            response.sendRedirect("frm_Dipot.jsp?upmsg=success");
        }
        else
        {
            String ins="insert into tbl_dipo (dipo_name,district_id) values ('"+dipo+"','"+district+"')";
            obj.executeCommand(ins);
            response.sendRedirect("frm_Dipot.jsp?inmsg=success");
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
        <form>
        <h1>Dipot/Main Station</h1>
        <table>
            <tr>
                <td>District</td>
                <td><select name="drpDist" required="required">
                        <option value="">---Select---</option>
                        <%
                            String sel="select * from tbl_district";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                        %>
                        <option value="<%=rs.getString("district_id")%>" <%if (district.equalsIgnoreCase(rs.getString("district_id"))){%> selected="selected"<%}%>> <%=rs.getString("district_name")%> </option>
                       <%  
                            }
                        %>
                    </select>
                </td>               
            </tr>
            <tr>
                <td>Dipot</td>
                <td><input type="text" name="txtdipot" required="required" value="<%=dipo%>"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btSub" value="Submit">
                    <input type="reset" name="btCancel" value="Cancel">
                <input type="hidden" name="hidno" value="<%=id%>"></td>
             </tr>
        </table>
    </center>
         
                    <table border="1">
                        <th>District</th>  
                        <th>Dipot</th>
                        <%
                        String sel1="select * from tbl_dipo d,tbl_district ds where d.district_id=ds.district_id";
                       
                        ResultSet rs1=obj.selectCommand(sel1);
                        while(rs1.next())
                        {
                        %>
                        <tr>
                            <td><%=rs1.getString("district_name")%></td>
                            <td><%=rs1.getString("dipo_name")%></td>
                            <td><a href="frm_Dipot.jsp?edt=<%=rs1.getString("dipo_id")%>">Edit</a></td>
                            <td><a href="frm_Dipot.jsp?del=<%=rs1.getString("dipo_id")%>">Delete</a></td>
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