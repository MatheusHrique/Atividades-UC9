package atividadenumbertriii;

import javax.swing.JOptionPane;

public class AtividadeNumberTriii {

    public static void main(String[] args) {
        boolean menu = true;
        while (menu) {
            String numString = JOptionPane.showInputDialog("Digite um número inteiro positivo:");
            if (numString == null) {
                menu = false;
            } else if (check(numString) == true) {
                int num = Integer.parseInt(numString);
                String divisores = "Divisores de " + num + " são: ";
                for (int i = 1; i <= num; i++) {
                    if (num % i == 0) {
                        divisores += i + ", ";
                    }
                }
                divisores = divisores.substring(0, (divisores.length()-2))+".";
                JOptionPane.showMessageDialog(null, divisores);
            } else {
                JOptionPane.showMessageDialog(null, "Erro na operação!");
                JOptionPane.showMessageDialog(null, "Tente novamente com um valor valido!");
            }

        }
    }

    public static boolean check(String numString) {
        try {
            int num = Integer.parseInt(numString);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
