%{
#include<stdio.h>
%}
%%
int|float {ECHO; printf("\t DATA TYPE\t\n");}
printf {ECHO;printf(" \t KEYWORD\t\n");}
%d|%f {ECHO ;printf(" \t FORMAT SPECIFIER\t\n");}
[;] {ECHO ;printf(" \t delimiter\t\n");}
[(),{}] {ECHO;printf(" \t SEPARATER\t\n");}
[+-/*=%><] {ECHO; printf(" \t OPERATOR\t\n");}
[a-zA-Z][a-zA-Z0-9]* {ECHO;printf(" \t IDENTIFIER\t\n");}
[-+]?[0-9]?[0-9]* {ECHO;printf("\t  NUMBER\t\n");}
. {}
%%
int yywrap()								
{
return 1;
}
int main(int argc ,char *argv[])
{
	yyin=fopen(argv[1],"r");
	yylex();


	return 0;


}
/*
lex token.l
gcc lex.yy.c -lfl
./a.out file.txt
*/
