%{
    #include <stdio.h>
%}

%%

[a-z]     { printf("%c is lowercase\n", yytext[0]); }
[A-Z]     { printf("%c is uppercase\n", yytext[0]); }
[^a-zA-Z] { printf("%c is non-alphabetic\n", yytext[0]); }

%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *fp = fopen(argv[1], "r");
    if (fp == NULL) {
        perror("Error opening file");
        return 1;
    }

    yyin = fp;
    yylex();  // Start lexical analysis
    fclose(fp);

    return 0;
}

int yywrap() {
    return 1;  // End of input
}


/*
lex checkUpperOrLower.l
gcc lex.yy.c
./a.out input.txt
*/

