package model;

public class Produto {
    private int id;
    private String nome;
    private int quantidade;
    private Categoria categoria;
    private Fornecedor fornecedor;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }

    public Produto(int id, String nome, int quantidade, Categoria categoria, Fornecedor fornecedor) {
        this.id = id;
        this.nome = nome;
        this.quantidade = quantidade;
        this.categoria = categoria;
        this.fornecedor = fornecedor;
    }

    public Produto() {
    }
}
