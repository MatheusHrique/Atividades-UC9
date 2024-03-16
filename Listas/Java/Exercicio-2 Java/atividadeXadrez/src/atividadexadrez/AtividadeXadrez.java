package atividadexadrez;
import java.util.Scanner;

public class AtividadeXadrez {

    public static void main(String[] args) {
        Scanner lerTeclado = new Scanner(System.in);
        JogoDaVelha jogo = new JogoDaVelha("Mario", "Luigi");
        CLS cls = new CLS();
        cls.clearConsole();
            
        int vez = 1;
        boolean loop=true;
        String waiting="";
        String resposta;
        char coluna='a';
        int linha=0;
        boolean check=false;
        String letra="";
        jogo.patch();
        
        while(loop){
            jogo.apresentarJogo();
            if(jogo.empatar()==true){
                loop=false;
                System.out.println("\n\n\n\nO JOGO ACABOU! EMPATE!!!\n\n\n");
            } else if(jogo.ifWin()==true){
                loop=false;
            } else {
            if(jogo.getCheck()==true){
                jogo.setCheck(false);
                System.out.println("\nManito!\nEssa casa ja foi ocupada, manito!  ");
                cls.clearConsole3();
                if(vez==1){
                    vez=2;
                } else if(vez==2){
                    vez=1;
                }
            } else {
                cls.clearConsole2();
            }
            if(check==true){
                check=false;
                System.out.print("Aviso: Casa inesxistente! Tente novamente!    ");
            }

            if(vez==1){ // O
                System.out.print("" + vez + ": ");
                letra="O";
                coluna = (lerTeclado.next()).charAt(0);
                linha = Integer.parseInt(lerTeclado.next());
                
                if(checkErro(coluna, linha)==true){ // Verificação de erro de coluna e linha
                    check=true;
                } else {
                    vez=2;
                    jogo.atualizarJogo(coluna, linha, jogo, letra);
                }

            } else { // X
                System.out.print("" + vez + ": ");
                letra="X";
                coluna = (lerTeclado.next()).charAt(0);
                linha = Integer.parseInt(lerTeclado.next());
                
                if(checkErro(coluna, linha)==true){ // Verificação de erro de coluna e linha
                    System.out.println("Tente novamente!");
                    check=true;
                } else {
                    vez=1;
                    jogo.atualizarJogo(coluna, linha, jogo, letra);
                }
                
                //if(jogo.getCheck()==true){
                //    vez=2;
                //}
            }
            //if(jogo.getCheck()==true){
            //    jogo.setCheck(false);
            //}
           cls.clearConsole();
            }
        }
    
        
    }
    
    public static boolean checkErro(char coluna, int linha){
        if(coluna=='A' || coluna== 'B' || coluna== 'C'){
            if(linha>=1 && linha<=3){
                return false;
            }
            return true;
        }
        return true;
    }
    
}
