%{ 
#include<stdio.h> 
int i; 
%} 
  
%% 
  
[0-9]+     {i=atoi(yytext); 
          if(i%2==0)  
               printf("Even"); 
          else
         printf("Odd");} 
%% 
   
int yywrap(){} 
   

int main() 
{ 
   
    yylex(); 
    return 0; 
}
/*
lex even_number.l
gcc lex.yy.c -lfl
./a.out
*/
