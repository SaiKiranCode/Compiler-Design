/*
steps to run the program

lex parser.l
yacc -d parser.y
cc lex.yy.c y.tab.c -w
./a.out


*/

%{
#include<stdlib.h>
#include<stdio.h>
#include"y.tab.h"
void yyerror(char *);
extern int yylval;
%}
%%
[0-9]+ {yylval=atoi(yytext);
	return NUMBER;
}
[-+/*\n] return *yytext;
[ \t] ;
. {}
%%
int yywrap(void)
{
	return 1;
}
