

%{
#include<stdio.h>
#include<string.h>

char word [] = "geeks";
int count = 0;


%}



%%
[a-zA-Z]+ { if(strcmp(yytext, word)==0)
				count++; }
. ;		 
%%


int yywrap()
{
	return 1;
}

/* code section */
int main()
{
		extern FILE *yyin, *yyout;
		
		/* open the input file
		in read mode */
		yyin=fopen("input.txt", "r");
		yylex();
		
		printf("%d \n", count);
	
}

/*
lex freqword.l
gcc lex.yy.c
./a.out input.txt
*/

/*input.txt
geeks for geeks is my fav site
*/