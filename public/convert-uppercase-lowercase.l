
%{ 
    #include<stdio.h>
    extern FILE *yyin;
%} 
    //Character classes
lower [a-z]
upper [A-Z]

%% 
    // Rules 
{lower} {printf("%c",yytext[0]- 32);}
{upper} {printf("%c",yytext[0]+ 32);}

%% 
 // Subroutines  
int yywrap(){
    return 1;
} 

int main(int argc, char *argv[]) {
    FILE *fp=fopen(argv[1],"r");
    yyin=fp;
    yylex();
    fclose(fp);    
    return 0 ;
}

/*
lex convert-uppercase-lowercase.l
gcc lex.yy.c
./a.out input.txt
*/


/*input.txt
hello My NAme is VaibhaBhiu
*/
