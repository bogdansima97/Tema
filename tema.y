%{
	#include <stdio.h>
	#include <string.h>
    int EsteCorecta = 1;

	int yylex();
	int yyerror(const char *msg);
	char msg[500];

%}

%union { char* sir; int val; }

%token TOK_PROGRAM TOK_VAR TOK_BEGIN TOK_END TOK_INTEGER TOK_READ TOK_WRITE TOK_FOR TOK_DO TOK_TO TOK_INT TOK_ID
%token TOK_MUL TOK_DIV TOK_PLUS TOK_MINUS TOK_ATTR
%token TOK_ERR

%start prog

%%

prog :
	TOK_PROGRAM TOK_ID TOK_VAR dec_list TOK_BEGIN stmt_list TOK_END '.'
	|
	error
	{  EsteCorecta=0; }
	;
dec_list:
	|
	dec
	|
	dec_list ';' dec
	;
dec:
	|
	id_list ':' TOK_INTEGER
	;
id_list:
	|
	TOK_ID
	|
	id_list ',' TOK_ID
	;
stmt_list:
	|
	stmt
	|
	stmt_list ';' stmt
	;
stmt:
	|
	TOK_ID TOK_ATTR E
	|
	TOK_READ '(' id_list ')'
	|
	TOK_WRITE '(' id_list ')'
	|
	TOK_FOR index_exp E TOK_DO body
	;
E:	T
	|
	E TOK_PLUS T
	|
	E TOK_MINUS T
	;
T:	F
	|
	T TOK_MUL F
	|
	T TOK_DIV F 
	;
F:	TOK_ID
	|
	TOK_INT 
	|
	'(' E ')' 
	;
index_exp:
	|
	TOK_ID TOK_ATTR E TOK_TO
	;
body:
	stmt
	|
	TOK_BEGIN stmt_list TOK_END
	;
%%

int main()
{
	yyparse();
	
	if(EsteCorecta == 1)
	{
		printf("CORECTA\n");		
	}	

       return 0;
}

int yyerror(const char *msg)
{
	printf("Error: %s\n", msg);
	return 1;
}
