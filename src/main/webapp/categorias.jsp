<%@	page contentType="text/html;charset=UTF-8" language="java" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Controle</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand">Estoque</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/controleEstoque/produtos-visualizar">Produtos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/controleEstoque/categorias-visualizar">Categorias</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/controleEstoque/fornecedores-visualizar">Fornecedores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/controleEstoque/grafico-visualizar">Gráfico</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <button class="btn btn-outline-danger" type="submit">Sair</button>
      </form>
    </div>
  </div>
</nav>
<div class="container" style="margin-top: 50px; width: 500px">
  <a href="cadastrarCategorias.jsp">Cadastrar categorias</a>
  <table class="table">
    <thead>
    <tr style="text-align: center;">
      <th scope="col">Nome</th>
      <th scope="col" colspan="2">Acoes</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${Categorias}">
      <tr style="text-align: center">
        <td>${c.nome}</td>
        <td><a href="http://localhost:8080/controleEstoque/categoria-controller?opcao=editar&&id=${c.id}">Editar</a></td>
        <td><a href="http://localhost:8080/controleEstoque/categoria-controller?opcao=excluir&&id=${c.id}">Excluir</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>