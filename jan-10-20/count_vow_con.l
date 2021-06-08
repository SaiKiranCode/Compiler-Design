%{ 
	#include<stdio.h>
	int vow_count=0; 
	int const_count =0; 
%} 
%% 
[aeiouAEIOU] {vow_count++;} 
[a-zA-Z]  {const_count++;}
%% 
int main() 
{ 
	printf("Enter the string of vowels and consonents:"); 
	yylex(); 
	printf("Number of vowels are: %d\n", vow_count); 
	printf("Number of consonants are: %d\n", const_count); 
	return 0; 
} 
/*
lex count_vow_con.l
gcc lex.yy.c -lfl
./a.out
*/
