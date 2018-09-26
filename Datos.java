public class Datos {
    private String token;
    private String lexema;
    private String posicion;
    
    public Datos(String token, String lexema, String posicion){
        this.token = token;
        this.lexema = lexema;
        this.posicion = posicion;
    }
    
    public Datos(){
        
    }
    
    public String getToken() {
        return token;
    }
    
    public void settoken(String token) {
        this.token = token;
    }
    
    public String getLexema() {
        return lexema;
    }
    
    public void setLexema(String lexema) {
        this.lexema = lexema;
    }
    
    public String getPosicion() {
        return posicion;
    }
    
    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }
}
