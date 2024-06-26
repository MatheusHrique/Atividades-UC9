
import javax.swing.JOptionPane;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

/**
 *
 * @author notch0 real
 */
public class main extends javax.swing.JFrame {

    /**
     * Creates new form main
     */
    public main() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txtPeso = new javax.swing.JTextField();
        btnCalcularPeso = new javax.swing.JButton();
        jRadioMercurio = new javax.swing.JRadioButton();
        jRadioVenus = new javax.swing.JRadioButton();
        jRadioMarte = new javax.swing.JRadioButton();
        jRadioJupiter = new javax.swing.JRadioButton();
        jRadioSaturno = new javax.swing.JRadioButton();
        jRadioUrano = new javax.swing.JRadioButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("Peso na terra (kg):");

        jLabel2.setText("Selecione o Planeta:");

        btnCalcularPeso.setText("Calcular Peso");
        btnCalcularPeso.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCalcularPesoActionPerformed(evt);
            }
        });

        buttonGroup.add(jRadioMercurio);
        jRadioMercurio.setText("Mercúrio");

        buttonGroup.add(jRadioVenus);
        jRadioVenus.setText("Vênus");

        buttonGroup.add(jRadioMarte);
        jRadioMarte.setText("Marte");

        buttonGroup.add(jRadioJupiter);
        jRadioJupiter.setText("Júpiter");

        buttonGroup.add(jRadioSaturno);
        jRadioSaturno.setText("Saturno");

        buttonGroup.add(jRadioUrano);
        jRadioUrano.setText("Urano");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(73, 73, 73)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jRadioVenus)
                            .addComponent(jRadioMercurio))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jRadioJupiter)
                            .addComponent(jRadioMarte))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jRadioSaturno)
                            .addComponent(jRadioUrano)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(txtPeso, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1, javax.swing.GroupLayout.Alignment.LEADING))
                        .addGap(33, 33, 33)
                        .addComponent(btnCalcularPeso))
                    .addComponent(jLabel2))
                .addContainerGap(98, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(56, 56, 56)
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtPeso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnCalcularPeso))
                .addGap(28, 28, 28)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jRadioMercurio)
                    .addComponent(jRadioMarte)
                    .addComponent(jRadioSaturno))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jRadioVenus)
                    .addComponent(jRadioJupiter)
                    .addComponent(jRadioUrano))
                .addContainerGap(77, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCalcularPesoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCalcularPesoActionPerformed
        if(check()==false){
            float pesoTerra=Float.parseFloat(txtPeso.getText());
            
            if(jRadioMercurio.isSelected()){
                JOptionPane.showMessageDialog(null, "O resultado ser: " + (pesoTerra*0.37) + " kg.");
            } else if(jRadioVenus.isSelected()){
                JOptionPane.showMessageDialog(null, "O resultado ser: " + (pesoTerra*0.88) + " kg.");
            } else if(jRadioMarte.isSelected()){
                JOptionPane.showMessageDialog(null, "O resultado ser: " + (pesoTerra*0.38) + " kg.");
            } else if(jRadioJupiter.isSelected()){
                JOptionPane.showMessageDialog(null, "O resultado ser: " + (pesoTerra*2.64) + " kg.");
            } else if(jRadioSaturno.isSelected()){
                JOptionPane.showMessageDialog(null, "O resultado ser: " + (pesoTerra*1.15) + " kg.");
            } else if(jRadioUrano.isSelected()){
                JOptionPane.showMessageDialog(null, "O resultado ser: " + (pesoTerra*1.17) + " kg.");
            }
            
        } else {
            JOptionPane.showMessageDialog(null, "Erro na operacao!");
            JOptionPane.showMessageDialog(null, "Insira um valor valido!");
        }
    }//GEN-LAST:event_btnCalcularPesoActionPerformed

    private boolean check(){
        try{
            float valor=Float.parseFloat(txtPeso.getText());
        } catch(Exception e){
            return true;
        }
        return false;
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new main().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCalcularPeso;
    private javax.swing.ButtonGroup buttonGroup;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JRadioButton jRadioJupiter;
    private javax.swing.JRadioButton jRadioMarte;
    private javax.swing.JRadioButton jRadioMercurio;
    private javax.swing.JRadioButton jRadioSaturno;
    private javax.swing.JRadioButton jRadioUrano;
    private javax.swing.JRadioButton jRadioVenus;
    private javax.swing.JTextField txtPeso;
    // End of variables declaration//GEN-END:variables
}
