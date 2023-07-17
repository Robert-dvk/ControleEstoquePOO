package controller;

import dao.ProdutoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("grafico-visualizar")
public class GraficoController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("Produtos", new ProdutoDAO().getProdutosByCategoria());
        RequestDispatcher rd = req.getRequestDispatcher("/grafico.jsp");
        rd.forward(req, resp);
    }
}
