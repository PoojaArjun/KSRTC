<%-- 
    Document   : frm_MainRoute
    Created on : Jul 11, 2017, 2:37:51 PM
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
       function getstartdist(id)
       {
           $.ajax(
           {
               url:"ajax_mainroute.jsp?type_name="+id,
               success:function(result)
               {
                   $("#divmain").html(result);
               }
           });
       }
   function getstartdipo(id1)
   {
       
       $.ajax(
           {
               url:"ajax_StartRoute.jsp?start_dipo="+id1,
               success:function(result)
               {
                   $("#StartDipo").html(result);
                   $("#DestDipo").html(result);
               }
           });
   }
   function getDestDipo(id2)
   {
       
       $.ajax(
           {
               url:"ajax_StartRoute.jsp?start_dipo="+id2,
               success:function(result)
               {
                   $("#Destrout").html(result);
               }
           });
   }
   
   
        </script>  
        
    </head>
    <%
         String start="";
    String dest="";
    String distance="";
    String bus_type="";
    if(request.getParameter("btsub")!=null)
    {
            
        bus_type=request.getParameter("drpBus");
        start=request.getParameter("StartRoute");
        dest=request.getParameter("DestRoute");
        distance=request.getParameter("txtdist");
        String ins="insert into tbl_mainroute(mainroute_start,mainroute_destination,mainroute_km,bus_type_id)values('"+start+"','"+dest+"',"+distance+","+bus_type+")";
      //out.println(ins);
        obj.executeCommand(ins);
        //response.sendRedirect("frm_MainRoute.jsp");
    }
        %>
    <body>
    <center>
        <form>
        <h1 align="center">Main Route</h1>
        <table>
            
            <tr>
                <td>Bus Type     
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <select name="drpBus" onchange="getstartdist(this.value)" required="required">                                
                                <option value="">---Select---</option>
                                <%
                                    String sel="select * from tbl_bus_type";
                                    ResultSet rs=obj.selectCommand(sel);
                                    while(rs.next())
                                    {
                                     %>
                                     <option value="<%=rs.getString("bus_type_id")%>"><%=rs.getString("bus_type_name")%></option>
                                     <%
                                    }
                                %>
                    </select></td>
            </tr>
            <tr>
                <td>
            <div id="divmain"></div>
                </td>
        </tr>
        
        </table>
        </form>
    </center>                     
  
    </body>
</html>
