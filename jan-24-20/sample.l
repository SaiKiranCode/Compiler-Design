%{
#include<stdio.h>
#include<stdlib.h>
struct lexeme
{
	char tokenname[20];
	char tokentype[20];
	char tokenvalue[20];

}s1,table[50];
int i=0;
int k;
%}


%%
float {
	i++;
	strcpy(s1.tokenname,"float");
	strcpy(s1.tokentype,"data type");
	strcpy(s1.tokenvalue,"NULL");
	
	table[i]=s1;

;}
int {	i++;
	strcpy(s1.tokenname,"int");
	strcpy(s1.tokentype,"data type");
	strcpy(s1.tokenvalue,"NULL");
	
	table[i]=s1;

;}
printf {	i++;
strcpy(s1.tokenname,"printf");
	strcpy(s1.tokentype,"key word");
	strcpy(s1.tokenvalue,"NULL");
	
	table[i]=s1;
}
%d|%f {i++;
	strcpy(s1.tokentype,"format specifier");
	strcpy(s1.tokenvalue,"NULL");
	strcpy(s1.tokenname,yytext);
	table[i]=s1;
	}
[;] { i++;
strcpy(s1.tokentype,"delimiter");
	strcpy(s1.tokenvalue,"NULL");
strcpy(s1.tokenname,yytext);
	table[i]=s1;	
}
[(),{}] { i++;
strcpy(s1.tokentype,"seperator");
	strcpy(s1.tokenvalue,"NULL");
	
strcpy(s1.tokenname,yytext);
	table[i]=s1;}
[+-/*=%><] {i++;
strcpy(s1.tokentype,"operator");
	strcpy(s1.tokenvalue,"NULL");
	
strcpy(s1.tokenname,yytext);
	table[i]=s1;}
[a-zA-Z][a-zA-Z0-9]* { i++;
strcpy(s1.tokentype,"identifier");
	strcpy(s1.tokenvalue,"NULL");
	
strcpy(s1.tokenname,yytext);
	table[i]=s1;}
[-+]?[0-9]?[0-9]* {
i++;
strcpy(s1.tokentype,"Number   ");
strcpy(s1.tokenvalue,yytext);	
	
strcpy(s1.tokenname,yytext);
	table[i]=s1;}
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
	
printf(" token\t\ttokentype\t\t\tvalue\n");
	for(k=0;k<=i;k++)
	{
	printf("%s\t\t%s\t\t\t%s\n",table[k].tokenname,table[k].tokentype,table[k].tokenvalue);
}
	return 0;


}
/*
lex sample.l
gcc lex.yy.c -lfl
./a.out file.txt
*/

