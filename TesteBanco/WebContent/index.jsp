<%--
<jsp:forward page="ProdutoServlet2"></jsp:forward>
 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<jsp:include page="cabecalho.jsp"></jsp:include>
	<body>
	
	<script type="text/javascript">
		function fecharApplet(){
			var appletFoto = document.getElementById('appletFoto');
			
			alert(appletFoto);
			appletFoto.setBackgroundColor();
			
		}

	
		window.onbeforeunload = function(){
			fecharApplet();
		}
	</script>
	<applet codebase="./applet" name="appletFoto" id="appletFoto"
						archive="webcam-applet_fat.jar"
						code="com/github/sarxos/webcam/WebcamAppletExample.class" 
						width="200" height="200" alt="Applet">
						<PARAM name="listenerUrl" value="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}">
						<PARAM name="buttonCaptureTitle" value="Tirar foto">
						<PARAM name="keyTokenImagem" value="/home/ec2-user/24242424">
						
					</applet>
	<%--
	<table border=1>
			<tr>
			<th>Fabricante <a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=fabricante&orderBy=asc">ASC</a>
				<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=fabricante&orderBy=desc">DESC</a>
			</th>
			<th>Modelo
			<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=modelo&orderBy=asc">ASC</a>
			<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=modelo&orderBy=desc">DESC</a>
			</th>
			<th>Especificacao
			<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=especificacao&orderBy=asc">ASC</a>
			<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=especificacao&orderBy=desc">DESC</a>
			</th>
			<th>Preço
			<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=preco&orderBy=asc">ASC</a>
			<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=preco&orderBy=desc">DESC</a>
			</th>
			<th>Vendedor
			<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=vendedor&orderBy=asc">ASC</a>
			<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=vendedor&orderBy=desc">DESC</a>
			</th>
			<th>Local
			<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=local&orderBy=asc">ASC</a>
			<a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeColuna=local&orderBy=desc">DESC</a>
			</th>
			</tr>
 					<applet codebase="./applet" name="appletFoto" id="appletFoto"
						archive="webcam-applet_fat.jar"
						code="com/github/sarxos/webcam/WebcamAppletExample.class" 
						width="200" height="200" alt="Applet">
						<PARAM name="listenerUrl" value="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}">
						<PARAM name="buttonCaptureTitle" value="Tirar foto">
						<PARAM name="keyTokenImagem" value="/home/ec2-user/24242424">
						
					</applet>

		<c:forEach items="${listProdutos}" var="produto">
				<tr>
				<td>${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}</td>
				
				<td>${produto.fabricante}</td>
				<td><a href="${ pageContext.request.scheme}://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${ pageContext.request.contextPath}/ProdutoServlet2?nomeModelo=${produto.modelo}">${produto.modelo}</a></td>
				<td>${produto.especificacao}</td>
				<td>${produto.preco}</td>
				<td>${produto.vendedor}</td>
				<td>${produto.local}</td>
				</tr>
		</c:forEach>
	</table>
	<jsp:include page="busca.jsp"></jsp:include>
	 --%>
	</body>
</html>
