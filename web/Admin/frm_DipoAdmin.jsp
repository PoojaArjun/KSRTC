<%-- 
    Document   : frm_DipoAdminn
    Created on : Jul 13, 2017, 2:10:10 PM
    Author     : sisira
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="ksrtc.Connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KSRTC</title>
        <script src="../Jquery.min.js"></script>
        <script>
            function getDipo(id)
       {
           $.ajax(
           {
               url:"ajax_Dipoadmin_Dipo.jsp?id="+id,
               success:function(result)
               {
                   $("#dipo").html(result);
               }
           });
       }
        </script>
    </head>
    <body>
    <center>
        <form enctype="multipart/form-data" >
        <h1>Dipo Admin Registration</h1>
        <table>
            <tr>
                <td>District</td>
                <td>
                    <select name="drpDist" onChange="getDipo(this.value)">
                        <option value="">---Select---</option>
                        <%
                        String sel="select * from tbl_district";
                        ResultSet rs=obj.selectCommand(sel);
                        while(rs.next())
                        {
                        %>
                        <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                        <%
                        }                        
                        %>
                    </select>                   
                </td>
            </tr>
            <tr>
                <td>Dipot</td>
                <td><select name="drpDipot" id="dipo">
                    <option value="">---Select</option>
                    </select></td>
            </tr>
            <tr>
                <td>Photo</td>
                <td><input type="file" name="imgdipo"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="txtname"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><textarea rows="4" cols="16"></textarea></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><input type="radio" name="radgender" value="female">Female
                <input type="radio" name="radgender" value="female">Male</td>
            </tr>
            <tr>
                <td>DOB</td>
                <td><input type="date" name="txtdate"></td>
            </tr>
            <tr>
                <td>Phone</td>                    
                <td><input type="text" name="txtphone"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="txtemail"></td>
            </tr>
            <tr>
                <td>Qualification</td>
                <td><input type="email" name="txtemail"></td>
            </tr>
            <tr>
                <td>Proof</td>
                <td><input type="file" name="qualimg"></td>
            </tr>
            <tr>
                <td>Username</td>                    
                <td><input type="text" name="txtuser"></td>
            </tr><tr>
                <td>Password</td>                    
                <td><input type="password" name="txtpassword"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" name="btSub" value="Submit">
                <input type="reset" name="btReset" value="Cancel"></td>               
            </tr>
        </table>
        </form>
    </center>
    </body>
</html>
