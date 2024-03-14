<%--
  Created by IntelliJ IDEA.
  User: fattani computers
  Date: 1/9/2024
  Time: 6:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Notes</title>
    <%@include file="all_js_css.jsp"%>
</head>
<body>

        <div class="container">
            <%@include file="navbar.jsp" %>
        </div>
        <br>
            <h1>Please Fill your details</h1>

            <%--this add form--%>
        <form action="SaveNoteServlet" method="post">
            <div class="mb-3">
                <label for="title">Note title</label>
                <input name="title" required type="text" class="form-control" id="Title" placeholder="enter here">



            </div>
            <div class="mb-3">
                <label for="content">Note Content</label>
                <textarea name="content" id="content" required  placeholder="enter your content here" class="form-control"></textarea>

            </div>
            <div class ="container text-center">

                <button type="submit" class="btn btn-primary">Add</button>

            </div>
        </form>
</body>
</html>
