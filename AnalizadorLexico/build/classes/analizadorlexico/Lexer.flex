package analizadorlexico;
import static analizadorlexico.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
LMayuscula=[A-Z]+
Minusuculas=[a-z_]+
D=[0-9]+
SignoNumero=[-]+
comentario=[//]
comenincial=[/*]+
comenfinal=[*/]+
comilla =["\""]+
Espacio=[ ]+
espacio=[ ,\t,\r]+
PDecimal =[.]+
If =[si]+
ELSE=[sino]+
integer=[entero]+
ParseInt =[cadenaAEntero]+
float=[real]+
ParseFloat =[cadenaAReal]+
Boleano=[Boleano]+
ParseBoolean=[cadenaABoleano]+
double=[Double]+
ParseDouble=[cadenaADouble]+
AString=[ACadena]+
ParentesisInicial= [(]+
ParentesisFinal = [)]+
TipoDeDatoBoleando=[boleano]+
Condicional=[>,<,==,!=,>=,<=]+
PC =[;]+
Sin=[seno]+
Cos=[coseno]+
Tan=[tangente]+
Log=[logaritmo]+
Asi =[=]+
SaltoLinea=[\n]+
LlaveInicial=[{]+
LlaveFinal=[}]+
Potencia=[potencia]+
Redondeo=[redondeo]+
Aleatorio=[aleatorio]+
Raiz=[raiz]+
system=[escribir]+
leer=[leer]+
UnionImpresion=[+]+
Incremento=[++]+
operacionesbasicas=[+,-,*,/,%]+
For=[desde]+
INT =[entero]+
Decremento=[--]+
Do=[entonces]+
Hacer=[hacer]+
While=[mientras]+
CorcheteInicial=[\[]+
CorcheteFinal=[\]]+
Coma=[,]+
Class=[clase]+
retornar=[devolver]+
menos=[-]+
VF = [verdadero,falso,1,0]+
Incrementar =[incrementar]+
Decrementar =[decrementar]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Comentario2 */
( "/*"(.)* ) {/*Ignore*/}

/* Comentario3 */
( "*/"(.)* ) {/*Ignore*/}

/* Comentario4 */
( "*"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
/*( "\"" ) {lexeme=yytext(); return Comillas;} */

/* Tipos de datos */
(entero | cadena | real | double | boleano) {lexeme=yytext(); return TipoDeDato;}

/* Tipo de dato Cadena */
{comilla}{Espacio}*(({L}|{D})*{Espacio}*)*{Espacio}*{comilla} {lexeme=yytext(); return CadenaDeTexto;}


/* Palabra reservada While */
( mientras ) {lexeme=yytext(); return While;}

/* Palabra reservada Entrada */
( leer ) {lexeme=yytext(); return Entrada;}

/* Palabra reservada Salida */
( escribir ) {lexeme=yytext(); return Salida;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Asignacion;}

/* Funcion Matematica Seno */
( "seno" ) {lexeme=yytext(); return Seno;}

/* Funcion Matematica Coseno */
( "coseno" ) {lexeme=yytext(); return Coseno;}

/* Funcion Matematica Tangente */
( "tangente" ) {lexeme=yytext(); return Tangente;}

/* Funcion Matematica Logaritmo */
( "logaritmo" ) {lexeme=yytext(); return Logaritmo;}

/* Operaciones */
((("(-"{D}+")")|{D}+)*|{Minusuculas}({L}|{D})*){Espacio}*{operacionesbasicas}{Espacio}*({D}*|{Minusuculas}({L}|{D})*){Espacio}*{PC} {lexeme=yytext(); return Operacion_basica;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Modulo */
( "%" ) {lexeme=yytext(); return Modulo;}

/* Exponencial */
( "^" ) {lexeme=yytext(); return Exponencial;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Condicional */
( ">" | "<" | "==" | "!=" | ">=" | "<=") {lexeme = yytext(); return Operando_Condicional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento */
( "++" ) {lexeme = yytext(); return Op_incremento;}

/* Operadores Decremento */
( "--" ) {lexeme = yytext(); return Op_decremento;}


/*Operadores Booleanos*/
(verdadero|falso)      {lexeme = yytext(); return Op_booleano;}

/*Nulo*/
(nulo)   {lexeme = yytext(); return Nulo;}

/* Variable */
{Minusuculas}({L}|{D})* {lexeme=yytext(); return Variable;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "Principal" ) {lexeme=yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero_Entero;}

/* Numero Real */
("(-"{D}+")")|{D}{PDecimal}({D})* {lexeme=yytext(); return Numero_Real;}

/* Numero entero negativo*/
{SignoNumero}({D})* {lexeme=yytext(); return Numero_Entero_Negativo;}

/* Numero Real negativo */
{SignoNumero}({D})*{PDecimal}({D})* {lexeme=yytext(); return Numero_Real_Negativo;}

/* Mostrar en pantalla */
{system}{Espacio}*{comilla}{Espacio}*(({L}|{D})*{Espacio}*)*{Espacio}*{comilla}{Espacio}*{UnionImpresion}*{Espacio}*{VF}{Espacio}* {lexeme=yytext(); return Salida_de_pantalla;}


/* CADENA A ENTERO */
{ParseInt}{ParentesisInicial}({comilla}(({L}|{D})*{Espacio}*)*{comilla}){ParentesisFinal} {lexeme=yytext(); return String_a_Entero;}

/* CADENA A REAL */
{ParseFloat}{ParentesisInicial}({comilla}(({L}|{D})*{Espacio}*)*{comilla}){ParentesisFinal} {lexeme=yytext(); return String_a_Real;}

/* STRING A BOLEANO */
{ParseBoolean}{ParentesisInicial}({comilla}(({L}|{D})*{Espacio}*)*{comilla}){ParentesisFinal} {lexeme=yytext(); return String_a_Boleano;}


/* STRING A Double */
{ParseDouble}{ParentesisInicial}({comilla}(({L}|{D})*{Espacio}*)*{comilla}){ParentesisFinal} {lexeme=yytext(); return String_a_Double;}

/* A CADENA */
{AString}{ParentesisInicial}{D}*{ParentesisFinal} {lexeme=yytext(); return a_STRING;}

/* Seno*/
{Sin}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal} {lexeme=yytext(); return Funcion_seno;}
/* Cos*/
{Cos}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal} {lexeme=yytext(); return Funcion_cos;}


/* Tan*/
{Tan}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal} {lexeme=yytext(); return Funcion_tan;}

/* Función Logaritmica*/
{Log}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal} {lexeme=yytext(); return Funcion_logaritmica;}


/* Función Potencia*/
{Potencia}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal} {lexeme=yytext(); return Funcion_potencia;}

/* Función Redondeo*/
{Redondeo}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal} {lexeme=yytext(); return Funcion_Redondeo;}


/* Función Número aleatorio*/
{Aleatorio}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal} {lexeme=yytext(); return Funcion_Numero_Aleatorio;}

/* Función Raiz*/
{Raiz}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal} {lexeme=yytext(); return Funcion_Raiz;}

/* Sentencia IF */
{If}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Condicional}{Espacio}*({L}|{D}|VF)*{Espacio}*{Do}{Espacio}*{SaltoLinea}*{Espacio}*{retornar}{Espacio}*({L}|{D}|{VF})*{Espacio}*{SaltoLinea}*{Espacio}*{ELSE}*{Espacio}*{SaltoLinea}*{Espacio}*{retornar}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Espacio}* {lexeme=yytext(); return Sentencia_If;}

/*  Pre incrementos*/
({Incremento}|{Decremento})({Minusuculas}({L}|{D})*){Espacio}* {lexeme=yytext(); return pre_increm;}

/*  Post incrementos*/
({Minusuculas}({L}|{D})*)({Incremento}|{Decremento}){Espacio}* {lexeme=yytext(); return post_incremento;}

/* Sentencia FOR */
{For}{Espacio}*{integer}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Asi}{Espacio}*{D}*{Espacio}*{While}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Condicional}{Espacio}*(({Minusuculas}({L}|{D})*)|{D}*|{VF}){Espacio}*({Incrementar}|{Decrementar}){Espacio}*{D}*{Espacio}*{Hacer} 
{Espacio}*{SaltoLinea}*{Espacio}*{system}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{PC}  {lexeme=yytext(); return Sentencia_for;}

/* Sentencia FOR2 */
{For}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{While}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Condicional}{Espacio}*(({Minusuculas}({L}|{D})*)|{D}*|{VF}){Espacio}*({Incrementar}|{Decrementar}){Espacio}*{D}*{Espacio}*{Hacer} 
{Espacio}*{SaltoLinea}*{Espacio}*{system}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{PC}  {lexeme=yytext(); return Sentencia_forINCDEC;}

/* Sentencia FOR3 */
{For}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{While}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Condicional}{Espacio}*(({Minusuculas}({L}|{D})*)|{D}*|{VF}){Espacio}*({Incrementar}|{Decrementar}){Espacio}*{D}*{Espacio}*{Hacer} 
{Espacio}*{SaltoLinea}*{Espacio}*{system}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{PC}{Espacio}*{SaltoLinea}* 
{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Asi}   {lexeme=yytext(); return Sentencia_forinc;}
/*{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{UnionImpresion}{Espacio}*{D}*{PC} */


/* Error de analisis */
 . {return ERROR;}
