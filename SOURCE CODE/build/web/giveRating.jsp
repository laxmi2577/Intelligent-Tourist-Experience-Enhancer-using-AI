

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uid = (String) session.getAttribute("uid");
    String uname = (String) session.getAttribute("uname");
    String location = request.getParameter("location");
    String rating = request.getParameter("rating");

    System.out.println("Location And Rating : " + location + rating);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement sto = con.createStatement();
    try {
        int i = st.executeUpdate("insert into rating (uid, uname, location, rating) values('"+ uid +"','"+ uname +"','"+ location +"','"+ rating +"')");
        if (i != 0) {

            response.sendRedirect("rating.jsp?Rating_added");
        } else {
            response.sendRedirect("rating.jsp?Failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>