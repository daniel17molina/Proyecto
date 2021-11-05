
package analizadorlexico;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
/**/

public class CrearLexemas {
   
    double numero = 2.5;
    
    public static void main(String[] args) throws Exception {
        System.out.println("")         ;
        String ruta1 = "C:/Users/jenif/OneDrive/Documentos/GitHub/Proyecto/AnalizadorLexico/src/analizadorlexico/Lexer.flex";
        String ruta2 = "C:/Users/Pablo García/Documents/GitHub/Proyecto/AnalizadorLexico/src/analizadorlexico/Lexer.flex";
        String ruta3 = "C:/Users/axelg/OneDrive/Documentos/GitHub/Proyecto/AnalizadorLexico/analisadorlexico/src/analizadorlexico/Lexer.flex";
        generar(ruta1);
    }
    public static void generar(String ruta1) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
      
    }
}
