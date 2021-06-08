%{ 
#include<stdio.h> 
#include<stdlib.h> 
%} 
%% 
^[0-9]*  printf("number "); 
^[^0-9]|[0-9]*[a-zA-Z]  printf("not a number"); 
. ; 
%% 
int main() 
{ 
        yylex(); 
        return 0; 
} 

/*
lex number.l
gcc lex.yy.c -lfl
./a.out
*/
