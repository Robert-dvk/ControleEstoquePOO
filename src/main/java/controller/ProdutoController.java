package controller;

import dao.ProdutoDAO;
import model.Categoria;
import model.Fornecedor;
import model.Produto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static java.lang.Integer.parseInt;

@WebServlet("produto-controller")
public class ProdutoController extends HttpServlet {
    protected void service (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String opcao = req.getParameter("opcao");
        Produto p = new Produto();
        Categoria c = new Categoria();
        Fornecedor f = new Fornecedor();
        if (opcao.equals("editar")) {
            String nome = req.getParameter("nome");
            String id = req.getParameter("id");
            String quantidade = req.getParameter("quantidade");
            String idFornecedor = req.getParameter("fornecedor");
            String idCategoria = req.getParameter("categoria");
            p.setId(parseInt(id));
            p.setNome(nome);
            p.setQuantidade(parseInt(quantidade));
            f.setId(parseInt(idFornecedor));
            c.setId(parseInt(idCategoria));
            p.setFornecedor(f);
            p.setCategoria(c);
            new  ProdutoDAO().editar(p);
        } else if (opcao.equals("excluir")) {
            String id = req.getParameter("id");
            p.setId(parseInt(id));
            new ProdutoDAO().excluir(p);
        } else if (opcao.equals("cadastrar")){
            String nome = req.getParameter("nome");
            String quantidade = req.getParameter("quantidade");
            String idFornecedor = req.getParameter("fornecedor");
            String idCategoria = req.getParameter("categoria");
            p.setNome(nome);
            p.setQuantidade(parseInt(quantidade));
            f.setId(parseInt(idFornecedor));
            c.setId(parseInt(idCategoria));
            p.setFornecedor(f);
            p.setCategoria(c);
            new  ProdutoDAO().cadastrar(p);
        }
        req.setAttribute("Produtos", new ProdutoDAO().getProdutos());
        RequestDispatcher rd = req.getRequestDispatcher("/produtos.jsp");
        rd.forward(req, resp);
    }
}
