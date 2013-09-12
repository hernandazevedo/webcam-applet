<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<jsp:include page="cabecalho.jsp"></jsp:include>
	<body>
	
	<center><b>DETALHES PRODUTO</b></center>		
		<br/>
		<c:forEach items="${listProdutos}" var="produto">
				
				Fabricante:	${produto.fabricante}<br/>
				Modelo: ${produto.modelo}<br/>
				Especificacao: ${produto.especificacao}<br/>
				Preco: ${produto.preco}<br/>
				Vendededor: ${produto.vendedor}<br/>
				Local: ${produto.local}<br/>

		</c:forEach>
	
	<form action="ProdutoServlet2" method="get">
		<input type="submit" value="Voltar">
	</form>
	</body>
</html>