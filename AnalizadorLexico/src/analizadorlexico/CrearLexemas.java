
package analizadorlexico;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class CrearLexemas {
    public static void main(String[] args) throws Exception {
        //C:/Users/jenif/Downloads/AnalizadorSintactico/AnalizadorLexico
        String ruta1 = "C:/Users/axelg/OneDrive/Escritorio/AnalizadorLexico/src/analizadorlexico/Lexer.flex";
        generar(ruta1);
    }
    public static void generar(String ruta1) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
      
    }
}
