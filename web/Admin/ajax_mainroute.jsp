<%-- 
    Document   : ajax_route
    Created on : Jul 12, 2017, 10:48:44 AM
    Author     : sisira
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="ksrtc.Connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   
    String type_name=request.getParameter("type_name");
   
       // String start_dipo=request.getParameter("start_dipo");
       
        if(type_name.equals("3"))
        {
       %>
       <table>
           <tr>
               <td>Start District</td>
               <td><select name="drpDist" onchange="getstartdipo(this.value)" required="required">
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
                   </select></td>
               </tr>
               <tr>
                   <td>Start dipo</td>
                   <td>
                       <select name="StartRoute" id="StartDipo" required="required">
                               <option value="">---Select---</option>
                       </select>
                   </td>
               </tr>
               <tr>
               <td>Destination District</td>
               <td><select name="drpDestDist" onchange="getDestDipo(this.value)" required="required">
                               <option value="">---Select---</option>
                               <%
                               String sel1="select * from tbl_district";
                                ResultSet rs1=obj.selectCommand(sel);
                                while(rs1.next())
                                {
                                    %>
                                    <option value="<%=rs1.getString("district_id")%>"><%=rs1.getString("district_name")%></option>
                                    <%
                                }
                               %>
                   </select></td>
               </tr>
               <tr>
                   <td>Destination dipo</td>
                   <td>
                       <select name="DestRoute" id="Destrout" required="required">
                               <option value="">---Select---</option>
                       </select>
                   </td>
               </tr>
               <tr>
         <td>Distance</td>
         <td><input type="text" name="txtdist" required="required"></td>
     </tr>
               <tr>
                   <td colspan="2" align="center"><input type="submit" name="btsub" value="Assign"/></td>
               </tr>
               
       </table>
       <%
        }  
        else
        {%>
            <table>
           <tr>
               <td>District</td>
               <td><select name="drpDist" onchange="getstartdipo(this.value)" required="required">
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
                   </select></td>
               </tr>
              <tr>
                   <td>Start</td>
                   <td>
                       <select name="StartRoute" id="StartDipo" required="required">
                               <option value="">---Select---</option>
                       </select>
                   </td>
               </tr>
            <tr>
                   <td>Destinaton</td>
                   <td>
                       <select name="DestRoute" id="DestDipo" required="required">
                               <option value="">---Select---</option>
                       </select>
                   </td>
                   <tr>
         <td>Distance</td>
         <td><input type="text" name="txtdist" required="required"></td>
     </tr>
               </tr>  
               <tr>
                   <td colspan="2" align="center"><input type="submit" name="btsub" value="Assign"/></td>
               </tr>
           
       <% }
     %>
     
      </table>
