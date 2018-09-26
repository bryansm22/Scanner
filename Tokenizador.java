// Clase que ser utilizada para devolver los tokens
public class Tokenizador {
 
  String token;
  String palabra;
  int linea;
  int columna;

    public Tokenizador(String token, String palabra) {
        this.token = token;
        this.palabra = palabra;
    }
  
  public String getLexema(){
    return this.palabra;
  }
 
  public String getToken(){
    return this.token;
  }

    public int getLine() {
        return linea;
    }
    
    public int getColumna() {
        return columna;
    }

    public void setColumna(int columna) {
        this.columna = columna;
    }
    
    public void setToken(String token) {
        this.token = token;
    }

    public void setPalabra(String palabra) {
        this.palabra = palabra;
    }

    public void setLine(int linea) {
        this.linea = linea;
    }
  
 
  Tokenizador (String lexema, String token,int linea,int columna){
    this.palabra = lexema;
    this.token = token;
    this.linea = linea;
    this.columna=columna;
  }
 
  public String toString(){
      return "Linea: "+this.linea+" - Columna: "+this.columna+" - Palabra: " + this.palabra + " - Token: " + this.token;
  }
}
