%{
#include<stdio.h>
int scicount=0;
%}
%%
[-+]?[0-9][.][0-9][E][-+]?[0-9]* {scicount++;}
[-+]?[0-9][.][0-9][e][-+]?[0-9]* {scicount++;}
. {}
%%
int  main() 
{ 
	printf("Enter the number"); 
	yylex(); 
	printf("Number of scientific format are: %d\n", scicount); 
	return 0; 
} 
/*
lex scientific.l
gcc lex.yy.c -lfl
./a.out
*/
