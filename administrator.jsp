<%-- 
    Document   : item list
    Created on : Jun 28, 2017, 9:34:50 PM
    Author     : AndroidStudio1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean class="db.db_class" id="obj"></jsp:useBean>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catogory</title>
    </head>
    <body>
        <form>
        <table border="3">
            
            <h1>Catogory</h1>
     <tr>
        <td>Catogory</td>
        <td>
            <input type="text" name="txtname">
        </td>
    </tr>
        <tr>
    <td colspan="2" align="center">
        <input type="submit" name="btnsubmit"  value="save">
        <input type="reset" name="btnreset"  value="cancel">
    </td>
        </tr>
        </table>
        <%
       if(request.getParameter("btnsubmit")!=null)
         {
              String Name=request.getParameter("txtname");
              String ins="insert into tbl_category(category_name) values('"+Name+"')";
              Select    
    System.out.println(ins);
    boolean b=obj.insert(ins);
    if (b==true)
    {
       out.println("success");
    }
   else
    {
     out.println("Failed");
    }  
                          
 } 
    %>
</form>
</body>
</html>
        
        
    
