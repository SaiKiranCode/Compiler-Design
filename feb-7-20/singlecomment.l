%{ 

%}
%% 

 
\/\/(.*) ; 
%% 

int main(int k,char **argcv) 
{ 
yyin=fopen("file1.c","r"); 
yyout=fopen("out1.c","w"); 
printf("Single line comments are removed and output is stored in the file out1.c\n");
yylex(); 

return 0; 
} 
/*
lex singlecomment.l
cc lex.yy.c -lfl
./a.out
*/

