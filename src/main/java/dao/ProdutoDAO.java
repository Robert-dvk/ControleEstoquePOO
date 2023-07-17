package dao;

import model.Categoria;
import model.Produto;
import model.Fornecedor;

import java.sql.*;
import java.util.ArrayList;

public class ProdutoDAO {
    private String sql;
    private Statement stmt;
    private ResultSet rs;
    private PreparedStatement prpstmt;
    private String status;

    public ArrayList<Produto> getProdutos() {
        ArrayList<Produto> produtos = new ArrayList<>();
        try (Connection connection = new ConectaDB().getConexao()) {

            this.sql = "SELECT p.id AS idProduto, p.nome AS nomeProduto, p.quantidade AS quantidadeProduto" +
                            ", c.id AS idCategoria, c.nome AS nomeCategoria," +
                            "f.id AS idFornecedor,  f.nome AS nomeFornecedor FROM produto p JOIN fornecedor f ON p.idfornecedor = f.id JOIN categoria c ON p.idcategoria = c.id";
            this.stmt = connection.createStatement();
            this.rs = this.stmt.executeQuery(this.sql);

            while (this.rs.next()) {
                Produto produto = new Produto();
                produto.setId(this.rs.getInt("idProduto"));
                produto.setNome(this.rs.getString("nomeProduto"));
                produto.setQuantidade(this.rs.getInt("quantidadeProduto"));

                Categoria c = new Categoria();
                c.setId(this.rs.getInt("idCategoria"));
                c.setNome(this.rs.getString("nomeCategoria"));
                produto.setCategoria(c);

                Fornecedor f = new Fornecedor();
                f.setId(this.rs.getInt("idFornecedor"));
                f.setNome(this.rs.getString("nomeFornecedor"));
                produto.setFornecedor(f);

                produtos.add(produto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produtos;
    }

    public ArrayList<Produto> getProdutosByCategoria() {
        ArrayList<Produto> produtos = new ArrayList<>();
        try (Connection connection = new ConectaDB().getConexao()) {

            this.sql = "SELECT c.nome as nomeCategoria, sum(p.quantidade) as quantidadeProduto FROM produto p JOIN categoria C on c.id = p.idcategoria GROUP BY c.nome";
            this.stmt = connection.createStatement();
            this.rs = this.stmt.executeQuery(this.sql);

            while (this.rs.next()) {
                Produto produto = new Produto();
                produto.setQuantidade(this.rs.getInt("quantidadeProduto"));

                Categoria c = new Categoria();
                c.setNome(this.rs.getString("nomeCategoria"));
                produto.setCategoria(c);

                produtos.add(produto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produtos;
    }


    public String cadastrar(Produto produto) {
        try (Connection connection = new ConectaDB().getConexao()) {
            this.sql = "INSERT INTO produto (nome, quantidade, idCategoria, idFornecedor) VALUES (?, ?, ?, ?)";

            this.prpstmt = connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);

            this.prpstmt.setString(1, produto.getNome());
            this.prpstmt.setInt(2, produto.getQuantidade());
            this.prpstmt.setInt(3, produto.getCategoria().getId());
            this.prpstmt.setInt(4, produto.getFornecedor().getId());

            System.out.println(produto.getNome() + " - " + produto.getQuantidade() + " - " + produto.getCategoria().getId() + " - " + produto.getFornecedor().getId());
            this.prpstmt.execute();
            this.rs = this.prpstmt.getGeneratedKeys();
            this.rs.next();

            if (this.rs.getInt(1) > 1) {
                this.status = "Ok";
            } else {
                System.out.println(this.sql);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return this.status;
    }

    public String editar(Produto produto) {
        try (Connection connection = new ConectaDB().getConexao()) {
            this.sql = "UPDATE produto SET nome = ?, quantidade = ?, idCategoria = ?, idFornecedor = ? WHERE id = ?";

            this.prpstmt = connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);

            this.prpstmt.setString(1, produto.getNome());
            this.prpstmt.setInt(2, produto.getQuantidade());
            this.prpstmt.setInt(3, produto.getCategoria().getId());
            this.prpstmt.setInt(4, produto.getFornecedor().getId());
            this.prpstmt.setInt(5, produto.getId());

            this.prpstmt.execute();
            this.rs = this.prpstmt.getGeneratedKeys();
            this.rs.next();

            if (this.rs.getInt(1) > 1) {
                this.status = "Ok";
            } else {
                System.out.println(this.sql);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return this.status;
    }
    public String excluir (Produto p) {
        try (Connection connection = new ConectaDB().getConexao()) {
            this.sql = "DELETE FROM produto WHERE id = ?";

            this.prpstmt = connection.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);

            this.prpstmt.setInt(1, p.getId());

            this.prpstmt.execute();
            this.rs = this.prpstmt.getGeneratedKeys();
            this.rs.next();
            if (this.rs.getInt(1) > 1) {
                this.status = "Ok";
            } else {
                System.out.println(this.sql);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return this.status;
    }
}
