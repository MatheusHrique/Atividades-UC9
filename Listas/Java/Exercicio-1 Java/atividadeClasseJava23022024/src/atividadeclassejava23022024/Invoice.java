package atividadeclassejava23022024;

public class Invoice {
    private int id_item;
    private String descricao;
    private int qntComprada;
    private double precoPago;
    
        Invoice(int id_item, String descricao, int qntComprada, double precoPago){
            this.id_item=id_item;
            this.descricao=descricao;
            this.qntComprada=qntComprada;
            this.precoPago=precoPago;
        }

    public int getId_item() {
        return id_item;
    }

    public String getDescricao() {
        return descricao;
    }

    public int getQntComprada() {
        return qntComprada;
    }

    public double getPrecoPago() {
        return precoPago;
    }

    public void setId_item(int id_item) {
        this.id_item = id_item;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setQntComprada(int qntComprada) {
        this.qntComprada = qntComprada;
    }

    public void setPrecoPago(double precoPago) {
        this.precoPago = precoPago;
    }
    
    void patch(){
        if(this.qntComprada < 0){
            this.qntComprada=0;
        }
        if(this.precoPago < 0){
            this.precoPago=0.0;
        }
    }
    
    double getInvoiceAmount(){
        patch();
        return this.qntComprada*this.precoPago;
    }
        
    void representarFaruta(){
        patch();
        double total = this.precoPago*this.qntComprada;
        System.out.println("\n\nId do item: " + this.id_item + ".\nDescricao: " + this.descricao + ".\nQuantidade: " + this.qntComprada + ".\nPreco: " + this.precoPago + ".\n\nValor total: " + total + "\n\n");
    }
}
