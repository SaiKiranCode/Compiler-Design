%{ 
#include<stdio.h>
%}
%% 

 				

\/\*(.*\n)*.*\*\/  {};		
\/\/(.*) ; 



%% 
int yywrap()
{
return 1;
}
int main(int k,char **argcv) 
{ 
yyin=fopen("file.c","r"); 
yyout=fopen("out.c","w"); 
printf("Single line and Multiple line comments are removed and output is stored in the file out.c\n");
yylex(); 
return 0; 
} 
/*
lex totalcomment.l
cc lex.yy.c -lfl
./a.out
*/
