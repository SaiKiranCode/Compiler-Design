%{ 
	#include<stdio.h>
	int float_count=0; 
%} 
%% 
[-+]?[0-9]+[.][0-9]+ {float_count++;}
%% 
int main() 
{ 
	printf("Enter the number"); 
	yylex(); 
	printf("Number of floating number are: %d\n", float_count); 
	return 0; 
} 
/*
lex float.l
gcc lex.yy.c -lfl
./a.out
*/
