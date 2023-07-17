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
        <a class="navbar-brand" href="paginaInicial.jsp">Estoque</a>
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
    <form method="POST" action="produto-controller">
        <div class="mb-3">
            <label for="nome" class="form-label">Nome:</label>
            <input type="text" class="form-control" id="nome" name="nome" placeholder="Digite o nome do produto...">
        </div>
        <div class="mb-3">
            <label for="quantidade" class="form-label">Quantidade:</label>
            <input type="number" class="form-control" id="quantidade" name="quantidade" placeholder="Digite a quantidade...">
        </div>
        <div class="mb-3">
            <label for="categoria" class="form-label">Categoria:</label>
            <select name="categoria" class="form-select" id="categoria">
                <option selected>Selecione uma categoria...</option>
                <c:forEach var="c" items="${Categorias}">
                    <option value="${c.id}">
                            ${c.nome}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="fornecedor" class="form-label">Fornecedor:</label>
            <select name="fornecedor" class="form-select" id="fornecedor">
                <option selected>Selecione um fornecedor...</option>
                <c:forEach var="f" items="${Fornecedores}">
                    <option value="${f.id}">
                            ${f.nome}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div style="text-align: center">
            <input type="submit" class="btn btn-primary" name="opcao" value="cadastrar">
        </div>
    </form>
</div>
</body>
</html>
