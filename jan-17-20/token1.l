%{
#include<stdio.h>
%}
%%
int|float {ECHO; printf(" DATA TYPE\t");}
printf {ECHO;printf("  KEYWORD\t");}
%d|%f {ECHO ;printf("  FORMAT SPECIFIER\t");}
[;] {ECHO ;printf("  delimiter\t");}
[(),{}] {ECHO;printf("  SEPARATER\t");}
[+-/*=%><] {ECHO; printf("  OPERATOR\t");}
[a-zA-Z][a-zA-Z0-9]* {ECHO;printf("  IDENTIFIER\t");}
[-+]?[0-9]?[0-9]* {ECHO;printf("  NUMBER\t");}
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
lex token1.l
gcc lex.yy.c -lfl
./a.out file.txt
*/
