<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tela Principal</title>
</head>
<body>
 	<center><b><c:out value="Busca de Produto"></c:out></b>
 	<form action="ProdutoServlet2" method="get">
 		<input id="parametroBusca" name="parametroBusca" type="text" />
 		<input type="submit" value="Buscar Produto">  
 	</form>
 	</center>
 </body>
</html>