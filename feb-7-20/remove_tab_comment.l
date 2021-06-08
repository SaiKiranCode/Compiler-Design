%{ 
#include<stdio.h>	
%} 


%% 
[\v\n\t]+  {fprintf(yyout,"");}
\/\*(.*\n)*.*\*\/  {};		
\/\/(.*) ; 
. { fprintf(yyout, "%s", yytext); } 
%% 

int main() 
{ 
	yyin = fopen("file.c", "r"); 
	yyout = fopen("Output.c", "w"); 
	printf("Tabs are removed and output is stored in the file Output.c\n");
	yylex(); 
	return 0; 
} 

/*
lex remove_tab_comment.l
gcc lex.yy.c -lfl
./a.out
*/
