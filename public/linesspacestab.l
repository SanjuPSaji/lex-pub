
%{
#include<stdio.h>
int lc=0,sc=0,tc=0,ch=0,wc=0; extern FILE *yyin;    
%}
 



%%

[\n] { lc++; ch+=yyleng;}
[  \t] { sc++; ch+=yyleng;}
[^\t] { tc++; ch+=yyleng;}
[^\t\n ]+ { wc++;  ch+=yyleng;}  


%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    FILE *fp = fopen(argv[1], "r");
    if (!fp) {
        printf("Error: Could not open file %s\n", argv[1]);
        return 1;
    }

    yyin = fp;
    yylex();
    printf("Number of lines : %d\n",lc);
    printf("Number of spaces : %d\n",sc);
    printf("Number of tabs, words, charc : %d , %d , %d\n",tc,wc,ch);
    return 0;
}

/*
lex linesspacestab.l
gcc lex.yy.c
./a.out input.txt
*/