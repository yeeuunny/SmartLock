<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% String[] _js = request.getParameterValues("_js"); %>

<!-- jQuery -->
<script src="/front/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/front/js/bootstrap.min.js"></script>

<script src="/front/js/notify.min.js"></script>

<script src="/front/js/notify.min.js"></script>

<% if (_js != null) { %>
<% for (int i = 0; i < _js.length; i++) { %>
<script src="<%= _js[i] %>"></script>
<% } %>
<% } %>
