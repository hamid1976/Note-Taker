<%@ page import="org.hibernate.Session" %>

<%@ page import="com.helper.FactoryProvider" %>

<%@ page import="java.util.List" %>
<%@ page import="com.entities.*" %>
<%@ page import="org.hibernate.Query" %>


<%--
  Created by IntelliJ IDEA.
  User: fattani computers
  Date: 1/10/2024
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All notes : Note Taker</title>
    <%@include file="all_js_css.jsp"%>
</head>
<body>
    <div class="container">
        <%@include file="navbar.jsp" %>
        <br>
        <h1 class="text-uppercase">All Notes:</h1>
        <div class="row">
            <div class ="col_12"></div>
        </div>
        <%
            Session s= FactoryProvider.getFactory().openSession();
             Query q=s.createQuery("from Note ");
            List<Note> list=q.list();
            for (Note note:list){

         %>

        <div class="card" >
            <img class="card-img-top mx-auto"style="max-width: 50px; " src="img/notes.png"  alt="">
            <div class="card-body">
                <h5 class="card-title"><%= note.getTitle()%></h5>
                <p class="card-text">
                    <%= note.getContent()%>
                </p>
<%--                <p><%= note.setAddedDate()%></p>--%>
                <div class="container text-center mt-2">
                <a href="DeleteServlet?note_id=<%= note.getId()%>" class="btn btn-danger">Delete</a>
                <a href="edit.jsp?note_id=<%= note.getId()%>" class="btn btn-primary">Update</a>
                </div>
            </div>
        </div>

         <%
            }
            s.close();
        %>
    </div>
</body>
</html>
