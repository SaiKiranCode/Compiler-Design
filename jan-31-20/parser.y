/*
steps to run the program

lex parser.l
yacc -d parser.y
cc lex.yy.c y.tab.c -w
./a.out


*/

%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%%
Line:Expr'\n'{printf("%d\n",$1);}
	|'n'
	;
Expr:Expr'+'Term{$$=$1+$3;}
	|Expr'-'Term{$$=$1-$3;}
	|Term{$$=$1;}
	;
Term:Term'*'Factor{$$=$1*$3;}
	|Term'/'Factor{$$=$1/$3;}
	|Factor{$$=$1;}
	;
Factor:'('Expr')'{$$=$2;}
	|NUMBER{$$=$1;}
	;
%%
void yyerror(char *s)
{
	fprintf(stderr,"%s\n",s);
	return;
}
int main(void)
{
	yyparse();
	return 0;
}
