%{
#include<stdio.h>
int c=0,w=0,b=0,l=0;
%}
WORD [^ \t\n,\.:]+
EOL [\n]
BLANK []
%%
WORD {w++;c=c+yyleng;}
BLANK {b++;}
EOL {l++;}
. {c++;}
%%
int main(int argc,char *argv[])
{
	yyin=fopen(argv[1],"r");
	yylex();
	printf("number of characters=%d\n number of  lines=%d\n number of words is %d\n",c,l,w);
	return 0;


} 
