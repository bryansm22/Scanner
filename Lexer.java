import java.io.BufferedReader;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;
import java.util.Set;
 
public class Lexer {
 
  public static void main(String[] args) {
 
  try{
 
      // Asignacion del nombre de archivo por defecto que usar la aplicacin
      String archivo = "prueba.txt";
 
      // Se trata de leer el archivo y analizarlo en la clase que se ha creado con JFlex
      BufferedReader buffer = new BufferedReader(new FileReader(archivo));
      Analizador analizadorJFlex = new Analizador(buffer);
      
      Map<Integer, Datos> map = new HashMap<Integer, Datos>();
      int contador = 1;
      while(true){
 
          // Obtener el token analizado y mostrar su informacion
          Tokenizador token = analizadorJFlex.yylex();
 
          if (!analizadorJFlex.existenTokens())
              break;
 
          System.out.println(token.toString());
          String posicion = token.getLine()+","+token.getColumna();
          
          map.put(contador,new Datos(token.getToken(),token.getLexema(),posicion));
          contador++;
      }
      System.out.println("---------------------------------------------------");
      
      for (Map.Entry<Integer, Datos> entry : map.entrySet()) {
          System.out.println("Num: " + entry.getKey() + " - Token: " + entry.getValue().getToken() + " - Lexema: " + entry.getValue().getLexema() + " - Posicion: " + entry.getValue().getPosicion());
      }
      
      //map.forEach((k,v) -> System.out.println("Lexema: " + k + " - Token: " + v.getLexema() + " - Posicion: " + v.getPosicion()));
      
 }
 catch (Exception e){
     System.out.println(e.toString());
 }
 }
}
