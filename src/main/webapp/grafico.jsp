<%@	page contentType="text/html;charset=UTF-8" language="java" %>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Controle</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
<div class="container" style="margin-top: 50px; width: 1100px">
    <c:forEach var="p" items="${Produtos}">
        <input type="hidden" class="nome-input" value="${p.categoria.nome}">
        <input type="hidden" class="quantidade-input" value="${p.quantidade}">
    </c:forEach>
    <h1>Gráfico por categoria</h1>
    <div id="piechart" style="width: 900px"></div>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(initialize);

        function initialize() {
            drawChart();
        }

        function drawChart() {
            var nomeInputs = document.querySelectorAll(".nome-input");
            var nomes = Array.from(nomeInputs).map(function(input) {
                return input.value;
            });

            var quantidadeInputs = document.querySelectorAll(".quantidade-input");
            var quantidades = Array.from(quantidadeInputs).map(function(input){
                return input.value;
            });

            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Nome');
            data.addColumn('number', 'Quantidade');

            for (var i = 0; i < nomes.length; i++) {
                data.addRow([nomes[i], parseInt(quantidades[i])]);
            }
            var options = {
                title: 'Itens por categoria',
                width: 800,
                height: 600,
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
    </script>
</div>
</body>
</html>
