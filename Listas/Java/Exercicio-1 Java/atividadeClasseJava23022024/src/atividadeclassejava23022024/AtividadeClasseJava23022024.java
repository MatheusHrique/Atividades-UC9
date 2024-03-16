package atividadeclassejava23022024;

import java.util.Scanner;

public class AtividadeClasseJava23022024 {

    public static void main(String[] args) {
        Scanner lerTeclado = new Scanner(System.in);
        Invoice loInvoice = new Invoice(0, "", 0, 0.0);
        boolean menu=true;
        int resposta=0;
        double respostaDouble=0;
        int id_item = 0;
        double preco = 0.0;
        int quantidade = 0;
        String descricao = "";
        String waiting="";
        boolean fatura=false;
        
        //try{
        while(menu){
            System.out.println("\n\n\n\n\n\n        -Lo mercado\n");
            System.out.println("1- Pegar fatura");
            System.out.println("2- Inserir valores da fatura");
            System.out.println("3- Ir embora");
            System.out.print("\nR: ");
            resposta = lerTeclado.nextInt();
            
            switch(resposta){
                case 1:
                    if(fatura==false){
                        System.out.println("\nNao existe nenhuma fatura!\n\nDigite qualquer coisa para continuar... ");
                        waiting = lerTeclado.next();
                        break;
                    }
                    loInvoice.representarFaruta();
                    System.out.println("Digite qualquer coisa para continuar... ");
                    waiting = lerTeclado.next();
                break;
                case 2:
                    System.out.println("\n\nId do item: ");
                    id_item = lerTeclado.nextInt();
        
                    System.out.println("\n\nDescricao do item: ");
                    descricao = lerTeclado.nextLine();
                    descricao = lerTeclado.nextLine();
                    //descricao = lerTeclado.nextLine();
                    
                    System.out.println("\n\nQuantidade: ");
                    quantidade = lerTeclado.nextInt();
        
                    System.out.println("\n\nPreco: ");
                    preco = lerTeclado.nextDouble();
                    
                    loInvoice = new Invoice(id_item, descricao, quantidade, preco);
                    fatura=true;
                break;
                case 3:
                    menu=false;
                    System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nSayonara!");
                break;
                default:
                    System.out.println("\nTente novamente\n");
                break;
            }
        }
        //} catch(Exception e){
        //    System.out.println("\nErro! Finalizando programa!\n");
        //}
    }
}
