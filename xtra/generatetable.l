%{
#include<stdio.h>
#include<stdlib.h>
struct lexeme
{
	char tokenname[20];
	char tokentype[20];
	char tokenvalue[20];

}s1;
%}


%%
float {
	strcpy(s1.tokenname,"float");
	strcpy(s1.tokentype,"data type");
	strcpy(s1.tokenvalue,"NULL");
	printf("%s %s %s\n" ,s1.tokenname,s1.tokentype,s1.tokenvalue);	

;}
int {
	strcpy(s1.tokenname,"int");
	strcpy(s1.tokentype,"data type");
	strcpy(s1.tokenvalue,"NULL");
	printf("%s %s %s\n" ,s1.tokenname,s1.tokentype,s1.tokenvalue);	

;}
printf {
strcpy(s1.tokenname,"printf");
	strcpy(s1.tokentype,"key word");
	strcpy(s1.tokenvalue,"NULL");
	printf("%s %s %s\n" ,s1.tokenname,s1.tokentype,s1.tokenvalue);	
}
%d|%f {
	strcpy(s1.tokentype,"data type");
	strcpy(s1.tokenvalue,"NULL");
	printf("%s %s %s\n" ,yytext,s1.tokentype,s1.tokenvalue);	}
[;] {strcpy(s1.tokentype,"delimiter");
	strcpy(s1.tokenvalue,"NULL");
	printf("%s %s %s\n" ,yytext,s1.tokentype,s1.tokenvalue);}
[(),{}] {strcpy(s1.tokentype,"seperator");
	strcpy(s1.tokenvalue,"NULL");
	printf("%s %s %s\n" ,yytext,s1.tokentype,s1.tokenvalue);}
[+-/*=%><] {strcpy(s1.tokentype,"operator");
	strcpy(s1.tokenvalue,"NULL");
	printf("%s %s %s\n" ,yytext,s1.tokentype,s1.tokenvalue);}
[a-zA-Z][a-zA-Z0-9]* {strcpy(s1.tokentype,"identifier");
	strcpy(s1.tokenvalue,"NULL");
	printf("%s %s %s\n" ,yytext,s1.tokentype,s1.tokenvalue);}
[-+]?[0-9]?[0-9]* {strcpy(s1.tokentype,"Number");
	
	printf("%s %s %d\n" ,yytext,s1.tokentype,atoi(yytext));}
. {}
%%
int yywrap()								
{
return 1;
}
int main(int argc ,char *argv[])
{
	
	yyin=fopen(argv[1],"r");
printf(" token\t\ttokentype\t\tvalue\n");
	yylex();
	

	return 0;


}
