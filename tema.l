%{
	#include "y.tab.h"
%}

NUMBER [0-9]*
NAME [a-zA-Z][a-zA-Z0-9_]*

%%

[ \t\n\r]+			;


PROGRAM			{ return TOK_PROGRAM; }
VAR			{ return TOK_VAR; }
BEGIN			{ return TOK_BEGIN; }
END			{ return TOK_END; }
INTEGER			{ return TOK_INTEGER; }
READ			{ return TOK_READ; }
WRITE			{ return TOK_WRITE; }
FOR			{ return TOK_FOR; }
DO			{ return TOK_DO; }
TO 			{ return TOK_TO; }
"+"			{ return TOK_PLUS; }
"-"			{ return TOK_MINUS; }
"*"			{ return TOK_MUL; }
DIV			{ return TOK_DIV; }
{NUMBER}			{ return TOK_INT; }
{NAME}			{ return TOK_ID; }
":="			{ return TOK_ATTR; }
"("			{ return '('; }
")"			{ return ')'; }
"."			{ return '.'; }
";"			{ return ';'; }
","			{ return ','; }
":"			{ return ':'; }
.			{ return TOK_ERR; }

%%
