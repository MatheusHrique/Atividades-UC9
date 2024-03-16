package atividadexadrez;

public class JogoDaVelha {

    private String[][] jogovelha = new String[3][3];
    private String jogador1;
    private String jogador2;
    private boolean check;

    JogoDaVelha(String jogador1, String jogador2) {
        this.jogador1 = jogador1;
        this.jogador2 = jogador2;
    }

    boolean empatar() {
        int notNull = 0;
        for (int y = 0; y < 3; y++) {
            for (int x = 0; x < 3; x++) {
                if (this.jogovelha[y][x] != " * ") {
                    notNull++;
                    if (notNull == 9) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public String[][] getJogovelha() {
        return jogovelha;
    }

    public void setJogovelha(int y, int x, String valor) {
        this.jogovelha[y][x] = valor;
    }

    public String getJogador1() {
        return jogador1;
    }

    public void setJogador1(String jogador1) {
        this.jogador1 = jogador1;
    }

    public String getJogador2() {
        return jogador2;
    }

    public void setJogador2(String jogador2) {
        this.jogador2 = jogador2;
    }

    public void setCheck(boolean bool) {
        this.check = bool;
    }

    public boolean getCheck() {
        return this.check;
    }

    public boolean ifWin() {
        String letra = "X";
        boolean endingGame=false;
        for (int turno = 0; turno < 2; turno++) {
            if (turno == 1) {
                letra = "O";
            }
            if (letra.equals(this.jogovelha[0][0].trim() ) && letra.equals(this.jogovelha[1][1].trim() ) && letra.equals(this.jogovelha[2][2].trim() )){
                endingGame=true; // diagonal direita
            } else if (letra.equals(this.jogovelha[0][2].trim() ) && letra.equals(this.jogovelha[1][1].trim() ) && letra.equals(this.jogovelha[2][0].trim() )) {
                endingGame=true; // diagonal esquerda
            } else if (letra.equals(this.jogovelha[0][0].trim() ) && letra.equals(this.jogovelha[0][1].trim() ) && letra.equals(this.jogovelha[0][2].trim() )) {
                endingGame=true; // linha 1
            } else if (letra.equals(this.jogovelha[1][0].trim() ) && letra.equals(this.jogovelha[1][1].trim() ) && letra.equals(this.jogovelha[1][2].trim() )) {
                endingGame=true; // linha 2
            } else if (letra.equals(this.jogovelha[2][0].trim() ) && letra.equals(this.jogovelha[2][1].trim() ) && letra.equals(this.jogovelha[2][2].trim() )) {
                endingGame=true; // linha 3
            } else if (letra.equals(this.jogovelha[0][0].trim() ) && letra.equals(this.jogovelha[1][0].trim() ) && letra.equals(this.jogovelha[2][0].trim() )) {
                endingGame=true; // coluna 1
            } else if (letra.equals(this.jogovelha[0][1].trim() ) && letra.equals(this.jogovelha[1][1].trim() ) && letra.equals(this.jogovelha[2][1].trim() )) {
                endingGame=true; // coluna 2
            } else if (letra.equals(this.jogovelha[0][2].trim() ) && letra.equals(this.jogovelha[1][2].trim() ) && letra.equals(this.jogovelha[2][2].trim() )) {
                endingGame=true; // coluna 3
            } 
            
            if(endingGame==true){
                int num=0;
                if(letra=="O"){
                    num=1;
                } else if(letra=="X"){
                    num=2;
                }
                System.out.println("\n\n\n\nO jogo acabou!\nO ganhador ser o jogador numero " + num + "!\n\n\n");
            }

        }
        return false;
    }

    public boolean check(char coluna, int linha, JogoDaVelha jogo, String letra) {

        int colunaNum = 0;
        linha = linha - 1;

        if (coluna == 'A') {
            colunaNum = 0;
        } else if (coluna == 'B') {
            colunaNum = 1;
        } else { // coluna=='C'
            colunaNum = 2;
        }
        if (jogovelha[linha][colunaNum] == " * ") {
            return true; // Permitido
        }
        return false; // NÃO PODE.
    } // jogovelha[y][x]

    public void atualizarJogo(char coluna, int linha, JogoDaVelha jogo, String letra) {
        switch (coluna) {
            case 'A' -> {
                switch (linha) {
                    case 1 -> {
                        if (jogo.check(coluna, linha, jogo, letra) == true) {
                            jogo.setJogovelha(0, 0, " " + letra + " ");
                        } else {
                            setCheck(true);
                        }
                    }
                    case 2 -> {
                        if (jogo.check(coluna, linha, jogo, letra) == true) {
                            jogo.setJogovelha(1, 0, " " + letra + " ");
                        } else {
                            setCheck(true);
                        }
                    }
                    case 3 -> {
                        if (jogo.check(coluna, linha, jogo, letra) == true) {
                            jogo.setJogovelha(2, 0, " " + letra + " ");
                        } else {
                            setCheck(true);
                        }
                    }
                }
            }

            case 'B' -> {
                switch (linha) {
                    case 1 -> {
                        if (jogo.check(coluna, linha, jogo, letra) == true) {
                            jogo.setJogovelha(0, 1, " " + letra + " ");
                        } else {
                            setCheck(true);
                        }
                    }
                    case 2 -> {
                        if (jogo.check(coluna, linha, jogo, letra) == true) {
                            jogo.setJogovelha(1, 1, " " + letra + " ");
                        } else {
                            setCheck(true);
                        }
                    }
                    case 3 -> {
                        if (jogo.check(coluna, linha, jogo, letra) == true) {
                            jogo.setJogovelha(2, 1, " " + letra + " ");
                        } else {
                            setCheck(true);
                        }
                    }
                }
            }

            case 'C' -> {
                switch (linha) {
                    case 1 -> {
                        if (jogo.check(coluna, linha, jogo, letra) == true) {
                            jogo.setJogovelha(0, 2, " " + letra + " ");
                        } else {
                            setCheck(true);
                        }
                    }
                    case 2 -> {
                        if (jogo.check(coluna, linha, jogo, letra) == true) {
                            jogo.setJogovelha(1, 2, " " + letra + " ");
                        } else {
                            setCheck(true);
                        }
                    }
                    case 3 -> {
                        if (jogo.check(coluna, linha, jogo, letra) == true) {
                            jogo.setJogovelha(2, 2, " " + letra + " ");
                        } else {
                            setCheck(true);
                        }
                    }
                }
            }

        }
    }

    public void patch() {
        for (int y = 0; y < 3; y++) {
            for (int x = 0; x < 3; x++) {
                this.jogovelha[y][x] = " * ";
            }
        }
    }

    public void apresentarJogo() {
        System.out.println("***Lo xadrez\n==============");
        for (int y = 0; y < 3; y++) {
            System.out.print("" + (y + 1) + "| ");
            for (int x = 0; x < 3; x++) {
                System.out.print("" + this.jogovelha[y][x] + "");
            }
            System.out.println("");
        }
        System.out.println(" # ---------");
        System.out.println("    A  B  C");
    }
}
