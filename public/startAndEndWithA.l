
%{ 
     #include<stdio.h>
     #include<ctype.h>
    int words=0;
    extern FILE *yyin;
%} 
    //character classes 
letter [a-zA-Z]
space [ \t]

%% 
    
(a|A){letter}*(a|A) { words++; }

. {}
%% 
 // Subroutines  
int yywrap(){
    return 1;
} 

int main(int argc, char *argv[]) {
    FILE *fp=fopen(argv[1],"r");
    yyin=fp;
    yylex();
    printf("Number of words starting with 'A' or 'a' are :  %d \n",words);
    fclose(fp);    
    return 0 ;
}


/*
lex startAndEndWithA.l
gcc lex.yy.c
./a.out input.txt
*/

/*input.txt
An apple a day is good amaericA ALOKA 
*/