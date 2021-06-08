%{
#include "stdio.h"
int result=0;
void yyerror(const char *str)
{
fprintf(stderr,"error: %s\n",str);
}

int yywrap(void)
{
return 1;
}
%}
%token number plus minus divide multiply
%left plus minus
%left multiply divide
%right '^'
%nonassoc UMINUS

%%
ae: exp  {result=$1;}
  ;
exp: number {  $$ = $1;}
   | exp minus exp {$$ = $1 - $3;}
   | exp plus exp { $$ = $1 + $3;}
   | exp divide exp { if ( $3 == 0 ) yyerror("divide by zero"); else $$ = $1 / $3;}
   | minus exp %prec UMINUS {$$ = -$2; }
   | exp multiply exp { $$ = $1 * $3 ;}
   | exp '^' exp {  }
   ;
%%
#include "math.h"

int main(void)
{

yyparse();
printf("= %d",result);
return 0;
}
