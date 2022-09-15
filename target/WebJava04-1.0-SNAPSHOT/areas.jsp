<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

 
<!DOCTYPE html>
<html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--validacion de sesion--%>
<%
    HttpSession misession= (HttpSession) request.getSession();
    String usuario= (String) misession.getAttribute("usuario");  
    if(misession == null || misession.getAttribute("usuario") == null){
          out.print("<link rel=\"stylesheet\" \n"
                    + "              href=\"webjars/bootstrap/5.1.0/css/bootstrap.min.css\" type=\"text/css\" />");
          out.println("<center>");           
          out.println("<h3>No tiene permisos para acceder a esta seccion</h3>");
          out.println("<a class='btn btn-primary' href='/WebJava04/login.jsp'>Ir a pagina de acceso</a>");
          out.println("</center>");
          return;
      }    
%>

<%
  String driver = "com.mysql.cj.jdbc.Driver";
  String url   = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
  String user   = "root";
  String pass   = "gatoronpedo123";
  
  Class.forName(driver);
  Connection xcon = DriverManager.getConnection(url, user, pass);
  
  String sql = "select * from areas";
  Statement stm = xcon.createStatement();
  ResultSet rs = stm.executeQuery(sql);
%>
 
<!DOCTYPE html>
<html>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=\"stylesheet\" href=\"webjars/bootstrap/5.1.0/css/bootstrap.min.css\" type=\"text/css\" />
        <link rel="stylesheet" href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h3>Usuario Logeado: <b><% out.print(usuario); %></b></h3>
            <h3><a class='btn btn-danger' href="/WebJava04/ServletSession">Cerrar Sesion</a></h3>

            <h1>Listado de Areas</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">CODIGO</th>
                        <th scope="col">NOMBRE</th>
                        <th scope="col">ESTADO</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>" + rs.getString(1) + "</td>");
                            out.print("<td>" + rs.getString(2) + "</td>");
                            out.print("<td>" + rs.getString(3) + "</td>");
                            out.print("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>

</html>
