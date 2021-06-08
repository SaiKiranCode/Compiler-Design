%{
#include "stdio.h"
#include "y.tab.h"
extern float yylval;
%}
%%
[0-9]+[.][0-9]+ {yylval=atof(yytext);return number;}
\+ { return plus;}
\- { return minus;}
\* { return multiply;}
\/ {return divide;}
. {return yytext[0];}
[ \t]+ ;
\n return 0;
%%
