<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="com.helper.*,org.hibernate.*,com.entities.*"%>
<%@ page import="com.entities.Note" %>
<%--
  Created by IntelliJ IDEA.
  User: fattani computers
  Date: 1/10/2024
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="all_js_css.jsp"%>>
</head>
<body>
    <div class="container">
        <%@include file="navbar.jsp" %>
        <h1>edit your note</h1>
        <br>
        <%
        int noteId=Integer.parseInt(request.getParameter("note_id").trim());
        Session s=FactoryProvider.getFactory().openSession();
        Note note=(Note)s.get(Note.class,noteId);
        %>

        <form action="UpdateSarvlet" method="post">
            <input value="<%= note.getId()%>" name="noteId" type="hidden"/>
            <div class="mb-3">
                <label for="title">Note title</label>
                <input name="title"
                       required type="text"
                       class="form-control" id="Title"
                       placeholder="enter here"
                       value="<%= note.getTitle() %>"
                />

            </div>
            <div class="mb-3">
                <label for="content">Note Content</label>
                <textarea name="content"  required id="content"
                          placeholder="enter your content here" class="form-control">
                    <%= note.getContent()%>
                </textarea>

            </div>
            <div class ="container text-center">

                <button type="submit" class="btn btn-success">Save</button>

            </div>
        </form>

    </div>

</body>
</html>
