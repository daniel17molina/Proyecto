package analizadorlexico;
import static analizadorlexico.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
LMayuscula=[A-Z]+
Minusuculas=[a-z_]+
D=[0-9]+
SignoNumero=[-, ]+
comentario=[//]
comenincial=[/*]+
comenfinal=[*/]+
comilla =["\""]+
Espacio=[ ]+
espacio=[ ,\t,\r]+
PDecimal =[.]+
If =[if]+
ELSE=[else]+
integer=[Integer]+
ParseInt =[parseInt]+
float=[Float]+
ParseFloat =[parseFloat]+
Boleano=[Boolean]+
ParseBoolean=[parseBoolean]+
double=[Double]+
ParseDouble=[parseDouble]+
AString=[toString]+
ParentesisInicial= [(]+
ParentesisFinal = [)]+
TipoDeDatoBoleando=[boolean]+
Condicional=[>,<,==,!=,>=,<=]+
PC =[;]+
math=[Math]+
radianes=[toRadians]+
Sin=[sin]+
Cos=[cos]+
Tan=[tan]+
Asi =[=]+
SaltoLinea=[\n]+
LlaveInicial=[{]+
LlaveFinal=[}]+
Log=[log]+
Potencia=[pow]+
Redondeo=[round]+
Aleatorio=[ramdom]+
Raiz=[sqrt]+
system=[System]+
Out=[out]+
Println=[println]+
UnionImpresion=[+]+
Incremento=[++]+
operacionesbasicas=[+,-,*,/,%]+
For=[for]+
INT =[int]+
Decremento=[--]+
Do=[do]+
While=[while]+
CorcheteInicial=[\[]+
CorcheteFinal=[\]]+
Coma=[,]+
Class=[class]+
VF = [true,false,1,0]+
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
/*( "\"" ) {lexeme=yytext(); return Comillas;}*/

/* Tipos de datos */
( byte | int | char | long | float | double |String | boolean) {lexeme=yytext(); return TipoDeDato;}

/* Tipo de dato Cadena */
{comilla}{Espacio}*(({L}|{D})*{Espacio}*)*{Espacio}*{comilla} {lexeme=yytext(); return CadenaDeTexto;}


/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada Entrada */
( leer ) {lexeme=yytext(); return Entrada;}

/* Palabra reservada Salida */
( escribir ) {lexeme=yytext(); return Salida;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Asignacion;}

/* Funcion Matematica Seno */
( "sen" ) {lexeme=yytext(); return Seno;}

/* Funcion Matematica Coseno */
( "cos" ) {lexeme=yytext(); return Coseno;}

/* Funcion Matematica Tangente */
( "tan" ) {lexeme=yytext(); return Tangente;}

/* Funcion Matematica Logaritmo */
( "log" ) {lexeme=yytext(); return Logaritmo;}

/* Operaciones */
((("(-"{D}+")")|{D}+)*|{Minusuculas}({L}|{D})*){Espacio}*{operacionesbasicas}{Espacio}*({D}*|{Minusuculas}({L}|{D})*){Espacio}*{PC} {lexeme=yytext(); return Operacion_basica;}

/* Operador Suma */
/*( "+" ) {lexeme=yytext(); return Suma;}*/

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
(true|false)      {lexeme = yytext(); return Op_booleano;}

/*Nulo*/
(null)   {lexeme = yytext(); return Nulo;}

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
( "main" ) {lexeme=yytext(); return Main;}

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
{system}{PDecimal}{Out}{PDecimal}{Println}{ParentesisInicial}{comilla}{Espacio}*(({L}|{D})*{Espacio}*)*{Espacio}*{comilla}{Espacio}*{UnionImpresion}*{Espacio}*{VF}{Espacio}*{ParentesisFinal}{PC} {lexeme=yytext(); return Salida_de_pantalla;}

/* STRING A INTEGER */
{integer}{PDecimal}{ParseInt}{ParentesisInicial}({comilla}(({L}|{D})*{Espacio}*)*{comilla}){ParentesisFinal}{PC} {lexeme=yytext(); return String_a_Entero;}

/* STRING A FLOAT */
{float}{PDecimal}{ParseFloat}{ParentesisInicial}({comilla}(({L}|{D})*{Espacio}*)*{comilla}){ParentesisFinal}{PC} {lexeme=yytext(); return String_a_Real;}

/* STRING A BOLEANO */
{Boleano}{PDecimal}{ParseBoolean}{ParentesisInicial}({comilla}(({L}|{D})*{Espacio}*)*{comilla}){ParentesisFinal}{PC} {lexeme=yytext(); return String_a_Boleano;}

/* STRING A Double */
{double}{PDecimal}{ParseDouble}{ParentesisInicial}({comilla}(({L}|{D})*{Espacio}*)*{comilla}){ParentesisFinal}{PC} {lexeme=yytext(); return String_a_Double;}

/* BOOLEAN A STRING */
{Boleano}{PDecimal}{AString}{ParentesisInicial}(({L}|{D})*{Espacio}*)*{ParentesisFinal}{PC} {lexeme=yytext(); return BOOLEAN_a_STRING;}

/* A RADIANES */
{math}{PDecimal}{radianes}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal}{PC} {lexeme=yytext(); return A_radianes;}

/* Seno*/
{math}{PDecimal}{Sin}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal}{PC} {lexeme=yytext(); return Funcion_seno;}

/* Cos*/
{math}{PDecimal}{Cos}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal}{PC} {lexeme=yytext(); return Funcion_cos;}

/* Tan*/
{math}{PDecimal}{Tan}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal}{PC} {lexeme=yytext(); return Funcion_tan;}

/* Función Logaritmica*/
{math}{PDecimal}{Log}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal}{PC} {lexeme=yytext(); return Funcion_logaritmica;}

/* Función Potencia*/
{math}{PDecimal}{Potencia}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal}{PC} {lexeme=yytext(); return Funcion_potencia;}

/* Función Redondeo*/
{math}{PDecimal}{Redondeo}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal}{PC} {lexeme=yytext(); return Funcion_Redondeo;}

/* Función Número aleatorio*/
{math}{PDecimal}{Aleatorio}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal}{PC} {lexeme=yytext(); return Funcion_Numero_Aleatorio;}

/* Función Raiz*/
{math}{PDecimal}{Raiz}{ParentesisInicial}(("(-"{D}+")")|{D}{PDecimal}({D})*){ParentesisFinal}{PC} {lexeme=yytext(); return Funcion_Raiz;}

/* Sentencia IF */
{If}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Condicional}{Espacio}*({L}|{D}|VF)*{Espacio}*{LlaveInicial}{Espacio}*{SaltoLinea}*{espacio}*({system}{PDecimal}{Out}{PDecimal}{Println}{ParentesisInicial}{comilla}{Espacio}*(({L}|{D})*{Espacio}*)*{Espacio}*{comilla}{Espacio}*{UnionImpresion}*{Espacio}*{VF}{Espacio}*{ParentesisFinal}{PC}){SaltoLinea}*{LlaveFinal}{Espacio}*{ELSE}{Espacio}*{LlaveInicial}{SaltoLinea}*{espacio}*({system}{PDecimal}{Out}{PDecimal}{Println}{ParentesisInicial}{comilla}{Espacio}*(({L}|{D})*{Espacio}*)*{Espacio}*{comilla}{Espacio}*{UnionImpresion}*{Espacio}*{VF}{Espacio}*{ParentesisFinal}{PC}){SaltoLinea}*{LlaveFinal} {lexeme=yytext(); return Sentencia_If;}

/*  Pre incrementos*/
({Incremento}|{Decremento})({Minusuculas}({L}|{D})*){Espacio}*{PC} {lexeme=yytext(); return pre_increm;}

/*  Post incrementos*/
({Minusuculas}({L}|{D})*)({Incremento}|{Decremento}){Espacio}*{PC} {lexeme=yytext(); return post_incremento;}

/* Sentencia FOR */
{For}{Espacio}*{ParentesisInicial}{Espacio}*{INT}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Asi}{Espacio}*{D}*{Espacio}*{PC}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Condicional}{Espacio}*(({Minusuculas}({L}|{D})*)|{D}*|{VF}){PC}{Espacio}*({Minusuculas}({L}|{D})*)({Incremento}|{Decremento}){Espacio}*{ParentesisFinal}{Espacio}*{SaltoLinea}*{LlaveInicial}{Espacio}*{SaltoLinea}*{Espacio}* ({system}{PDecimal}{Out}{PDecimal}{Println}{ParentesisInicial}{comilla}{Espacio}*(({L}|{D})*{Espacio}*)*{Espacio}*{comilla}{Espacio}*{UnionImpresion}*{Espacio}*{ParentesisFinal}{PC}){SaltoLinea}*{LlaveFinal} {lexeme=yytext(); return Sentencia_for;}


/* do-while */
{Do}{Espacio}*{SaltoLinea}*{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Asi}{Espacio}* (((("(-"{D}+")")|{D}+)*|{Minusuculas}({L}|{D})*){Espacio}*{operacionesbasicas}{Espacio}*({D}*|{Minusuculas}({L}|{D})*){Espacio}*){Espacio}*{SaltoLinea}*{Espacio}* ({Minusuculas}({L}|{D})*){Espacio}*{Asi}{Espacio}* (((("(-"{D}+")")|{D}+)*|{Minusuculas}({L}|{D})*){Espacio}*{operacionesbasicas}{Espacio}*({D}*|{Minusuculas}({L}|{D})*){Espacio}*){Espacio}*{SaltoLinea}*{Espacio}*{While}{Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{Condicional}{D}*{Espacio}* {lexeme=yytext(); return Ciclo_While;}

/* classes */
(( private | public | protected)){Espacio}*{Class}{Espacio}*({LMayuscula}({L}|{D})*){Espacio}*{LlaveInicial}{Espacio}*{SaltoLinea}{Espacio}*((( private | public | protected)){Espacio}*(( byte | int | char | long | float | double |String | boolean)){Espacio}*({Minusuculas}({L}|{D})*){PC}{SaltoLinea}*{Espacio}*)*(( private | public | protected)){Espacio}*(( byte | int | char | long | float | double |String | boolean)){Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{ParentesisInicial}{Espacio}*((( byte | int | char | long | float | double |String | boolean)){Espacio}*({Minusuculas}{Espacio}*{Coma}{Espacio}*(( byte | int | char | long | float | double |String | boolean)) ({L}|{D})*)({LMayuscula}({L}|{D})*){Espacio}*)*{ParentesisFinal}{Espacio}*{SaltoLinea}{Espacio}*{LlaveInicial}{Espacio}*{SaltoLinea}{Espacio}*{system}{PDecimal}{Out}{PDecimal}{Println}{ParentesisInicial}{comilla}{Espacio}*(({L}|{D})*{Espacio}*)*{Espacio}*{comilla}{Espacio}*{UnionImpresion}*{Espacio}*{VF}{Espacio}*{ParentesisFinal}{PC}{SaltoLinea}{Espacio}*{LlaveFinal} {lexeme=yytext(); return Clase;}

/*  */

/* Arreglos */
(( byte | int | char | long | float | double |String | boolean)){Espacio}*({Minusuculas}({L}|{D})*){Espacio}*{CorcheteInicial}{Espacio}*{D}*{Espacio}*{CorcheteFinal}{Espacio}*{Asi}{Espacio}*{LlaveInicial}{Espacio}*(({D}*{Espacio}*{Coma}{Espacio}*{D}*{Espacio}*)){Espacio}*{LlaveFinal}{Espacio}* {lexeme=yytext(); return Arreglo;}

/* Dentro de Arreglos */
({D}*{Espacio}*{Coma}{Espacio}*{D}*{Espacio}*) {lexeme=yytext(); return Dentro_Arreglo;}

/* Error de analisis */
 . {return ERROR;}
