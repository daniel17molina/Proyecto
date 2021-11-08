package analizadorlexico;

import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringReader;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.Symbol;
import javax.swing.JFileChooser;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import javax.swing.JOptionPane;

public class analizadorlexico extends javax.swing.JFrame {

    public analizadorlexico() {
        initComponents();
        transparenciButton();
        this.setLocationRelativeTo(null);
    }

    public void transparenciButton() {
        btnAnalizarLex.setOpaque(false);
        btnAnalizarLex.setContentAreaFilled(false);
        btnAnalizarLex.setBorderPainted(false);
        btnLimpiarLex.setOpaque(false);
        btnLimpiarLex.setContentAreaFilled(false);
        btnLimpiarLex.setBorderPainted(false);
        btnArchivo.setOpaque(false);
        btnArchivo.setContentAreaFilled(false);
        btnArchivo.setBorderPainted(false);
    }

    private void analizarLexico() throws IOException {
        int cont = 1;

        String expr = (String) txtResultado.getText();
        Lexer lexer = new Lexer(new StringReader(expr));

        String resultado = "LINEA " + cont + "\t\tSIMBOLO\n";
        while (true) {
            Tokens token = lexer.yylex();
            if (token == null) {
                txtAnalizarLex.setText(resultado);
                return;
            }
            switch (token) {
                case Linea:
                    cont++;
                    resultado += "LINEA " + cont + "\n";
                    break;
                case TipoDeDato:
                    resultado += "  <Tipo de Dato>\t" + lexer.lexeme + "\n";
                    break;
                case CadenaDeTexto:
                    resultado += "  <Cadena de Texto>\t" + lexer.lexeme + "\n";
                    break;

                case Do:
                    resultado += "  <Reservada do>\t" + lexer.lexeme + "\n";
                    break;
                case While:
                    resultado += "  <Reservada while>\t" + lexer.lexeme + "\n";
                    break;
                case For:
                    resultado += "  <Reservada while>\t" + lexer.lexeme + "\n";
                    break;
                case Ciclo_While:
                    resultado += " <Ciclo While>\t\t" + lexer.lexeme + "\n";
                    break;
                case Entrada:
                    resultado += "  <Reservada Entrada>\t" + lexer.lexeme + "\n";
                    break;
                case Salida:
                    resultado += "  <Reservada Salida>\t" + lexer.lexeme + "\n";
                    break;
                case Asignacion:
                    resultado += "  <Operador igual>\t" + lexer.lexeme + "\n";
                    break;
                case Seno:
                    resultado += "  <Funcion Matematica Seno>\t" + lexer.lexeme + "\n";
                    break;
                case Coseno:
                    resultado += "  <Funcion Matematica Coseno>\t" + lexer.lexeme + "\n";
                    break;
                case Tangente:
                    resultado += "  <Funcion Matematica tangente>\t" + lexer.lexeme + "\n";
                    break;
                case Logaritmo:
                    resultado += "  <Funcion Matematica Logaritmo>\t" + lexer.lexeme + "\n";
                    break;
                case Suma:
                    resultado += "  <Operador suma>\t" + lexer.lexeme + "\n";
                    break;
                case Resta:
                    resultado += "  <Operador resta>\t" + lexer.lexeme + "\n";
                    break;
                case Multiplicacion:
                    resultado += "  <Operador multiplicacion>\t" + lexer.lexeme + "\n";
                    break;
                case Division:
                    resultado += "  <Operador division>\t" + lexer.lexeme + "\n";
                    break;
                case Modulo:
                    resultado += "  <Operador modulo>\t" + lexer.lexeme + "\n";
                    break;
                case Exponencial:
                    resultado += "  <Exponencial>\t" + lexer.lexeme + "\n";
                    break;
                case Op_logico:
                    resultado += "  <Operador logico>\t" + lexer.lexeme + "\n";
                    break;
                case Op_incremento:
                    resultado += "  <Operador incremento>\t" + lexer.lexeme + "\n";
                    break;
                case Op_decremento:
                    resultado += "  <Operador decremento>\t" + lexer.lexeme + "\n";
                    break;
                case Operando_Condicional:
                    resultado += "  <Condicional>\t" + lexer.lexeme + "\n";
                    break;
                case Op_atribucion:
                    resultado += "  <Operador atribucion>\t" + lexer.lexeme + "\n";
                    break;
                case Op_booleano:
                    resultado += "  <Operador booleano>\t" + lexer.lexeme + "\n";
                    break;
                case Nulo:
                    resultado += "  <Nulo>\t" + lexer.lexeme + "\n";
                    break;
                case Variable:
                    resultado += "  <Variable>\t\t" + lexer.lexeme + "\n";
                    break;
                case Parentesis_a:
                    resultado += "  <Parentesis de apertura>\t" + lexer.lexeme + "\n";
                    break;
                case Parentesis_c:
                    resultado += "  <Parentesis de cierre>\t" + lexer.lexeme + "\n";
                    break;
                case Llave_a:
                    resultado += "  <Llave de apertura>\t" + lexer.lexeme + "\n";
                    break;
                case Llave_c:
                    resultado += "  <Llave de cierre>\t" + lexer.lexeme + "\n";
                    break;
                case Corchete_a:
                    resultado += "  <Corchete de apertura>\t" + lexer.lexeme + "\n";
                    break;
                case Corchete_c:
                    resultado += "  <Corchete de cierre>\t" + lexer.lexeme + "\n";
                    break;
                case Main:
                    resultado += "  <Reservada main>\t" + lexer.lexeme + "\n";
                    break;
                case P_coma:
                    resultado += "  <Punto y coma>\t" + lexer.lexeme + "\n";
                    break;
                case Identificador:
                    resultado += "  <Identificador>\t\t" + lexer.lexeme + "\n";
                    break;
                case Numero_Entero:
                    resultado += "  <Número Entero>\t\t" + lexer.lexeme + "\n";
                    break;
                case Numero_Real:
                    resultado += "  <Número Real>\t\t" + lexer.lexeme + "\n";
                    break;
                case Numero_Entero_Negativo:
                    resultado += "  <Número Entero Negativo>\t\t" + lexer.lexeme + "\n";
                    break;
                case Numero_Real_Negativo:
                    resultado += "  <Número Real Negativo>\t\t" + lexer.lexeme + "\n";
                    break;
                case String_a_Real:
                    resultado += "  <Funciones de conversión (String a Real)>\t" + lexer.lexeme + "\n";
                    break;
                case String_a_Entero:
                    resultado += "  <Funciones de conversión (String a Entero)>\t" + lexer.lexeme + "\n";
                    break;
                case String_a_Boleano:
                    resultado += "  <Funciones de conversión (String a Boleano)>\t" + lexer.lexeme + "\n";
                    break;
                case String_a_Double:
                    resultado += "  <Funciones de conversión (String a Double)>\t" + lexer.lexeme + "\n";
                    break;
                case a_STRING:
                    resultado += "  <Funciones de conversión>\t" + lexer.lexeme + "\n";
                    break;
                case Sentencia_If:
                    resultado += "  <Sentencia IF>\t\t" + lexer.lexeme + "\n";
                    break;
                case Asignacion_boleana:
                    resultado += "  <Asignación Boleana>\t\t" + lexer.lexeme + "\n";
                    break;
                case A_radianes:
                    resultado += "  <Conversion a Radianes>\t\t" + lexer.lexeme + "\n";
                    break;
                case Funcion_seno:
                    resultado += "  <Función Seno>\t\t" + lexer.lexeme + "\n";
                    break;
                case Funcion_cos:
                    resultado += "  <Función Coseno>\t\t" + lexer.lexeme + "\n";
                    break;
                case Funcion_tan:
                    resultado += "  <Función Tangente>\t\t" + lexer.lexeme + "\n";
                    break;
                case Funcion_logaritmica:
                    resultado += "  <Función Logaritmica>\t\t" + lexer.lexeme + "\n";
                    break;
                case Funcion_Redondeo:
                    resultado += "  <Función Redondeo>\t\t" + lexer.lexeme + "\n";
                    break;
                case Funcion_Numero_Aleatorio:
                    resultado += "  <Función Número Aleatorio>\t\t" + lexer.lexeme + "\n";
                    break;
                case Funcion_potencia:
                    resultado += "  <Función Potencia>\t\t" + lexer.lexeme + "\n";
                    break;
                case Funcion_Raiz:
                    resultado += "  <Función Raiz>\t\t" + lexer.lexeme + "\n";
                    break;
                case Salida_de_pantalla:
                    resultado += "  <Salida de pantalla>\t\t" + lexer.lexeme + "\n";
                    break;
                case Operacion_basica:
                    resultado += "  <Operación  aritmética>\t\t" + lexer.lexeme + "\n";
                    break;
                case pre_increm:
                    resultado += "  <Pre-incrementos>\t\t" + lexer.lexeme + "\n";
                    break;
                case post_incremento:
                    resultado += "  <Post-incrementos>\t\t" + lexer.lexeme + "\n";
                    break;
                case Sentencia_for:
                    resultado += "  < ciclo DESDE>\t\t" + lexer.lexeme + "\n";
                    break;
                case Clase:
                    resultado += " <Clase> \t" + lexer.lexeme + "\n";
                    break;
                case Funcion_recursiva:
                    resultado += " <Función Recursiva> \t" + lexer.lexeme + "\n";
                    break;
                case Sentencia_forINCDEC:
                    resultado += " <Ciclo DESDE decrementando> \t" + lexer.lexeme + "\n";
                    break;
                case Sentencia_forinc:
                    resultado += " <Ciclo DESDE sin incremento> \t" + lexer.lexeme + "\n";
                    break;
                case Salida2:
                    resultado += " <Salida de pantalla> \t" + lexer.lexeme + "\n";
                    break;
                case Entrada2:
                    resultado += " <Entra de datos> \t" + lexer.lexeme + "\n";
                    break;
                case DeclaracionVariable:
                    resultado += " <Declaración de variables> \t" + lexer.lexeme + "\n";
                    break;
                case Funcion_sumar:
                    resultado += " < Función sumar original> \t" + lexer.lexeme + "\n";
                    break;
                case Funcion_sumar2:
                    resultado += " < Función sumar para tipos reales> \t" + lexer.lexeme + "\n";
                    break;
                case ERROR:
                    resultado += "  <Simbolo no definido>\n";
                    break;
                default:
                    resultado += "  < " + lexer.lexeme + " >\n";
                    break;
            }
        }
    }

    public void CrearArchivo() {

        try {
            int cont = 1;

            String expr = (String) txtResultado.getText();
            // Lexer lexer = new Lexer(new StringReader(expr));
            //String resultado = "LINEA " + cont + "\t\tSIMBOLO\n";
            //C:/Users/jenif/OneDrive/Documentos/GitHub/Proyecto/AnalizadorLexico
            String ruta = "C:/Users/jenif/OneDrive/Documentos/GitHub/Proyecto/AnalizadorLexico/ArchivioLexico.txt";
            String ruta2 = "C:/Users/Pablo García/Documents/GitHub/Proyecto/AnalizadorLexico/ArchivioLexico.txt";
            String ruta3 = "C:/Users/axelg/OneDrive/Documentos/GitHub/Proyecto/AnalizadorLexico/ArchivioLexico.txt";
            String contenido = txtAnalizarLex.getText();
            File file = new File(ruta2);
            // Si el archivo no existe es creado
            if (!file.exists()) {
                file.createNewFile();
            }
            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(contenido);
            bw.close();
            JOptionPane.showMessageDialog(null, "SU ARCHIVO .TXT FUE CREADO CON EXITO");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        btnArchivo = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtResultado = new javax.swing.JTextArea();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtAnalizarLex = new javax.swing.JTextArea();
        btnAnalizarLex = new javax.swing.JButton();
        btnLimpiarLex = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(204, 255, 204));

        jPanel1.setBackground(new java.awt.Color(102, 102, 102));
        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Analizador Lexico", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 18))); // NOI18N

        btnArchivo.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnArchivo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/archivo (1).png"))); // NOI18N
        btnArchivo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnArchivoActionPerformed(evt);
            }
        });

        txtResultado.setBackground(new java.awt.Color(204, 204, 204));
        txtResultado.setColumns(20);
        txtResultado.setRows(5);
        jScrollPane1.setViewportView(txtResultado);

        txtAnalizarLex.setEditable(false);
        txtAnalizarLex.setBackground(new java.awt.Color(204, 204, 204));
        txtAnalizarLex.setColumns(20);
        txtAnalizarLex.setRows(5);
        jScrollPane2.setViewportView(txtAnalizarLex);

        btnAnalizarLex.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnAnalizarLex.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/analizando.png"))); // NOI18N
        btnAnalizarLex.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarLexActionPerformed(evt);
            }
        });

        btnLimpiarLex.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        btnLimpiarLex.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/computadora (2).png"))); // NOI18N
        btnLimpiarLex.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLimpiarLexActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(48, 48, 48)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 314, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnArchivo))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnAnalizarLex)
                    .addComponent(btnLimpiarLex))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 143, Short.MAX_VALUE)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 322, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(65, 65, 65))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(36, 36, 36)
                .addComponent(btnArchivo)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(btnAnalizarLex)
                        .addGap(46, 46, 46)
                        .addComponent(btnLimpiarLex)
                        .addGap(0, 276, Short.MAX_VALUE))
                    .addComponent(jScrollPane1))
                .addGap(16, 16, 16))
            .addComponent(jScrollPane2)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnArchivoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnArchivoActionPerformed
        // TODO add your handling code here:
        JFileChooser chooser = new JFileChooser();
        chooser.showOpenDialog(null);
        File archivo = new File(chooser.getSelectedFile().getAbsolutePath());

        try {
            String ST = new String(Files.readAllBytes(archivo.toPath()));
            txtResultado.setText(ST);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(analizadorlexico.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(analizadorlexico.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnArchivoActionPerformed

    private void btnLimpiarLexActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLimpiarLexActionPerformed
        // TODO add your handling code here:
        txtAnalizarLex.setText(null);

    }//GEN-LAST:event_btnLimpiarLexActionPerformed

    private void btnAnalizarLexActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarLexActionPerformed
        try {
            analizarLexico();
            CrearArchivo();
        } catch (IOException ex) {
            Logger.getLogger(analizadorlexico.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnAnalizarLexActionPerformed

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
            java.util.logging.Logger.getLogger(analizadorlexico.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(analizadorlexico.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(analizadorlexico.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(analizadorlexico.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new analizadorlexico().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAnalizarLex;
    private javax.swing.JButton btnArchivo;
    private javax.swing.JButton btnLimpiarLex;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextArea txtAnalizarLex;
    private javax.swing.JTextArea txtResultado;
    // End of variables declaration//GEN-END:variables
}
