<%-- 
    Document   : frm_Time
    Created on : Jul 12, 2017, 8:37:00 PM
    Author     : sisira
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="ksrtc.Connection" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id="";
    String edtid="";
    String delid="";
    
    String stime="";
    String dtime="";
    String mainroute="";
    edtid=request.getParameter("edt");
    delid=request.getParameter("del");
    
    
    if(delid!=null)
    {
        String delt="delete from tbl_time where time_id="+delid+"";
        obj.executeCommand(delt);
        response.sendRedirect("frm_Times.jsp?delmsg=success");
    }
    
    if(edtid!=null)
    {
         String str1 = "select distinct(mainroute_id) as m from tbl_mainroute";
         ResultSet rs7=obj.selectCommand(str1);
         while(rs7.next())
         {
         
                String sel="select * from tbl_time where time_id='"+edtid+"'";
                out.println(sel);
                ResultSet rs5=obj.selectCommand(sel);
                while(rs5.next())
                {
                mainroute=rs5.getString("mainroute_id");
                stime=rs5.getString("start_time");
                dtime=rs5.getString("end_time");
                id=rs5.getString("time_id");
                }
         }
        
    }
    
    if(request.getParameter("btSub")!=null)
    {
        stime=request.getParameter("txtstime");
        dtime=request.getParameter("txtdtime");
        mainroute=request.getParameter("drpmainroute");
        
        String ins="insert into tbl_time (start_time,end_time,mainroute_id)values ('"+stime+"','"+dtime+"','"+mainroute+"')";
        obj.executeCommand(ins);
       response.sendRedirect("frm_Times.jsp?inmsg=success");
                
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KSRTC</title>
    </head>
    <body>
    <form>
        <center>
        <h1>Time Details</h1>
        <table>
        <tr>
            <td>Main Route</td>
            <td><select name="drpmainroute" required="required" >
                     <option value="">---Select---</option>
                        <%
                            String s1 = "select distinct(mainroute_id) as m from tbl_mainroute";
                            ResultSet a1= obj.selectCommand(s1);
                            while(a1.next())
                            {
                                    String mid = a1.getString("m");
                                    System.out.println("m : "+mid);
                                    String sel = "select d1.dipo_name as f,d2.dipo_name as d from tbl_dipo d1,tbl_dipo d2,tbl_mainroute m where d1.dipo_id=m.mainroute_destination and mainroute_id='"+mid+"' and d2.dipo_id=m.mainroute_start";                          
                                    ResultSet rs=obj.selectCommand(sel);
                                    while(rs.next())
                                    {
                            %>
                                                  <option value="<%=mid%>"><%=rs.getString("d2.d")%>-<%=rs.getString("d1.f")%></option>
                                                  <%

                                    }
                             }
                                                    %>
                </select></td>
        </tr>
        
        <tr>
            <td>Start time</td>
            <td><input type="time" name="txtstime" value="<%=stime%>"></td>
            
        </tr>
        <tr>
            <td>End time</td>
            <td><input type="time" name="txtdtime" value="<%=dtime%>"></td>
        </tr>
        <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btSub" value="Submit">
                    <input type="reset" name="btCancel" value="Cancel"></td>
       <input type="hidden" name="hidno" value="<%=id%>"
        </tr>
        </table>
        </center>
       <table border="1" cellpadding="">  
           <th>Main Route</th>
           <th>Start Time</th>
           <th>End Time</th>
           
           <%
                String sel="select distinct(time_id) as n from tbl_time";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {
                 String tid=rs.getString("n");
                 String sel1 = "select d1.dipo_name as f,d2.dipo_name as d,start_time,end_time from tbl_dipo d1,tbl_dipo d2,tbl_mainroute m,tbl_time t where d1.dipo_id=m.mainroute_destination and d2.dipo_id=m.mainroute_start and t.mainroute_id=m.mainroute_id and t.time_id='"+tid+"'";
                 ResultSet rs1=obj.selectCommand(sel1);
                 while(rs1.next())
                 {
%>  
                        <tr>
                             <td><%=rs1.getString("d2.d")%>-<%=rs1.getString("d1.f")%></td>
                             <td><%=rs1.getString("start_time")%></td>
                              <td><%=rs1.getString("end_time")%></td>
                             <td><a href="frm_Times.jsp?edt=<%=tid%>">Edit</a></td>
                             <td><a href="frm_Times.jsp?del=<%=tid%>">Delete</a></td>
                        </tr>
<%
                    }
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