<%-- 
    Document   : frm_Seat
    Created on : Jul 11, 2017, 1:40:24 PM
    Author     : sisira
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="ksrtc.Connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id = "";
    String edtid = "";
    String hid = "";
    String delid = "";
    edtid = request.getParameter("edt");
    delid = request.getParameter("del");

    String category = "";
    String seat = "";

    if (delid != null) {
        String delt = "delete from tbl_seat where seat_id='" + delid + "'";
        obj.executeCommand(delt);
        response.sendRedirect("frm_Seat.jsp?delmsg=success");
    }

    if (edtid != null) {
        String sel = "select * from tbl_seat where seat_id='" + edtid + "'";
        ResultSet rs = obj.selectCommand(sel);
        while (rs.next()) {
            id = rs.getString("seat_id");
            seat = rs.getString("seat_count");
            category = rs.getString("seat_cat_id");
        }
    }

    if (request.getParameter("btSub") != null) {
        out.println("fgfygfyg");
        category = request.getParameter("drpCat");
        seat = request.getParameter("txtseat");
        hid = request.getParameter("hidno");
        if (hid != "") {
            String updt = "update tbl_seat set seat_count='" + seat + "',seat_cat_id='" + category + "' where seat_id='" + hid + "'";
            obj.executeCommand(updt);
            response.sendRedirect("frm_Seat.jsp?upmsg=success");
        } 
        else
        {
            String ins = "insert into tbl_seat (seat_count,seat_cat_id) values ('" + seat + "','" + category + "')";
            out.println(ins);
            obj.executeCommand(ins);
            response.sendRedirect("frm_Seat.jsp?inmsg=success");
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
            <h1>Seat Management</h1>
            <table>
                <tr>
                    <td>Category</td>
                    <td><select name="drpCat" required="required">
                            <option value="">---Select---</option>
                            <%
                                String sel = "select * from tbl_seat_category";
                                ResultSet rs = obj.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("seat_cat_id")%>" <%if (category.equalsIgnoreCase(rs.getString("seat_cat_id"))) {%> selected="selected"<%}%>> <%=rs.getString("seat_cat_name")%> </option>
                            <%
                                }
                            %>
                        </select>
                    </td>               
                </tr>
                <tr>
                    <td>Seat</td>
                    <td><input type="text" name="txtseat" required="required" value="<%=seat%>"></td>
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
        <th>Category</th>  
        <th>Seat</th>
            <%
                String sel1 = "select * from tbl_seat s,tbl_seat_category sc where s.seat_cat_id=sc.seat_cat_id";
                ResultSet rs1 = obj.selectCommand(sel1);
               // out.print(sel1);
                while (rs1.next()) {
            %>
        <tr>
            <td><%=rs1.getString("seat_cat_name")%></td>
            <td><%=rs1.getString("seat_count")%></td>
            <td><a href="frm_Seat.jsp?edt=<%=rs1.getString("seat_id")%>">Edit</a></td>
            <td><a href="frm_Seat.jsp?del=<%=rs1.getString("seat_id")%>">Delete</a></td>
        </tr>
        <%
            }
        %>
    </table>
</form>
</body>
</html>
<%
    if (request.getParameter("inmsg") != null && request.getParameter("inmsg").equalsIgnoreCase("success")) {
%>
<script>alert("Inserted")</script>
<%}%>

<%
    if (request.getParameter("upmsg") != null && request.getParameter("upmsg").equalsIgnoreCase("success")) {
%>
<script>alert("Updated")</script>
<%}%>

<%
    if (request.getParameter("delmsg") != null && request.getParameter("delmsg").equalsIgnoreCase("success")) {
%>
<script>alert("Deleted")</script>
<%}%>