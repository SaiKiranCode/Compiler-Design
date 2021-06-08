%{
#include<stdio.h>
int c=0,w=0,b=0,l=0,n=0,t=0;
%}

%%
[ ] {b++;}
\n {l++;}
([0-9])* {n++;c=c+yyleng;}
([a-zA-Z0-9])* {w++;c=c+yyleng;}
\t {t++;}
. {}
%%
int main(int argc,char *argv[])
{
	yyin=fopen(argv[1],"r");
	yylex();
	printf("number of characters=%d\n number of  lines=%d\n number of words is %d\nnumber of numbers is %d\n number of blanks is %d \n number of tabs is %d\n",c,l,w,n,b,t);
	


} 

/*
lex allcount.l
gcc lex.yy.c -lfl
./a.out
*/
