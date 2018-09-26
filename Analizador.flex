/* Seccion de declaraciones de JFlex */
%%
%public
%class Analizador
%{
 
 /* Codigo personalizado */
 
 // Se agrego una propiedad para verificar si existen tokens pendientes
 private boolean _existenTokens = false;
 
 public boolean existenTokens(){
 return this._existenTokens;
 }
 
%}
 
 /* Al utilizar esta instruccion, se le indica a JFlex que devuelva objetos del tipo Tokenizador */
%type Tokenizador
 
%init{
 /* Codigo que se ejecutar en el constructor de la clase */
%init}
 
%eof{
 
 /* Codigo a ejecutar al finalizar el analisis, en este caso cambiaremos el valor de una variable bandera */
 this._existenTokens = false;
 
%eof}

%line
%column 
/* Inicio de Expresiones regulares */
 
 Digito = [0-9]
 Operador = "*"|"+"|"-"|"/"
 Simbolo = "#"|","|"$"|"%"|"&"|"["|"]"|"."|"!"
 Quote = [\"]
 GuionB = "_"
 Numero = {Digito}{Digito}*
 Flotante = {Digito}{Digito}*"."{Digito}{Digito}*
 Letra = [A-Za-z]
 Identificador = {GuionB}{Letra}*|{Letra}{Letra}*|{Letra}{Numero}{Letra}|{Letra}{Numero}|{GuionB}{Numero}
 Espacio = " "
 SaltoDeLinea = \n|\r|\r\n
 Pr = "if"|[Ee]"lse"|[Pp]"rivate"|[Ss]"tatic"|"int"|[Uu]"sing"|"namespace"|"public"|"class"|[Mm]"ain"
 PuntoComa = ";"
 ParI="("
 ParD=")"
 LlaveI="{"
 LlaveC="}"
 
/* Finaliza expresiones regulares */
 
%%
/* Finaliza la seccion de declaraciones de JFlex */
 
/* Inicia seccion de reglas */
 
// Cada regla esta formada por una {expresion} espacio {codigo}
 
{Digito} {
 Tokenizador t = new Tokenizador(yytext(), "DIGITO", yyline,yycolumn);
 this._existenTokens = true;
 return t;
}

{Quote} {
 Tokenizador t = new Tokenizador(yytext(), "COMILLA",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}

{ParI} {
 Tokenizador t = new Tokenizador(yytext(), "PARENTESIS_APERTUTA",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}


{LlaveI} {
 Tokenizador t = new Tokenizador(yytext(), "INICIO_BLOQUE",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}

{LlaveC} {
 Tokenizador t = new Tokenizador(yytext(), "FIN_BLOQUE",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}

{ParD} {
 Tokenizador t = new Tokenizador(yytext(), "PARENTESIS_CIERRE",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}

{Numero} {
 Tokenizador t = new Tokenizador(yytext(), "CONSTANTE NUMERICA",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}

{Pr} {
 Tokenizador t = new Tokenizador(yytext(), "PALABRA RESERVADA",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}

{Operador} {
 Tokenizador t = new Tokenizador(yytext(), "OPERADOR",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}

{PuntoComa} {
 Tokenizador t = new Tokenizador(yytext(), "FIN_INSTRUCCION",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}
 
{Identificador} {
 Tokenizador t = new Tokenizador(yytext(), "IDENTIFICADOR",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}

{Flotante} {
 Tokenizador t = new Tokenizador(yytext(), "CONSTANTE NUMERICA FLOTANTE",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}
 
{Simbolo} {
 Tokenizador t = new Tokenizador(yytext(), "SIMBOLO",yyline,yycolumn);
 this._existenTokens = true;
 return t;
}
 
{Espacio} {
 // Ignorar cuando se ingrese un espacio
}
 
{SaltoDeLinea} {
 Tokenizador t = new Tokenizador("Enter", "NUEVA_LINEA",yyline,yycolumn);
 this._existenTokens = true;
 
}
