/*Lex code to count total number of tokens */

%{ 
int n = 0 ; extern FILE *yyin;   
%} 


%% 


"while"|"if"|"else" {n++;printf("\t keywords : %s", yytext);} 


"int"|"float" {n++;printf("\t keywords : %s", yytext);} 


[a-zA-Z_][a-zA-Z0-9_]* {n++;printf("\t identifier : %s", yytext);} 


"<="|"=="|"="|"++"|"-"|"*"|"+" {n++;printf("\t operator : %s", yytext);} 


[(){}|, ;] {n++;printf("\t separator : %s", yytext);} 


[0-9]*"."[0-9]+ {n++;printf("\t float : %s", yytext);} 


[0-9]+ {n++;printf("\t integer : %s", yytext);}						 

. ; 
%% 
int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) 

{  FILE *fp = fopen(argv[1], "r");
    if (!fp) {
        printf("Error: Could not open file %s\n", argv[1]);
        return 1;
    }

    yyin = fp;
	
	yylex(); 
	
	printf("\n total no. of token = %d\n", n); 
	
} 


/*
lex totaltokens.l
gcc lex.yy.c
./a.out input.txt
*/