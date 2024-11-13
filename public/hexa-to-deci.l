%{
#include <stdio.h>
#include <stdlib.h>
%}

%option noyywrap

DIGIT [0-9]
HEXDIGIT [0-9A-Fa-f]

%%

{HEXDIGIT}+ {
    int decimal = 0;
    char *hex = yytext;
    while (*hex != '\0') {
        int digit;
        if (*hex >= '0' && *hex <= '9') {
            digit = *hex - '0';
        } else if (*hex >= 'A' && *hex <= 'F') {
            digit = *hex - 'A' + 10;
        } else if (*hex >= 'a' && *hex <= 'f') {
            digit = *hex - 'a' + 10;
        } else {
            printf("Invalid hexadecimal digit: %c\n", *hex);
            return 1;
        }
        decimal = decimal * 16 + digit;
        hex++;
    }
    printf("%s (hex) = %d (decimal)\n", yytext, decimal);
}

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <hexadecimal_number>\n", argv[0]);
        return 1;
    }
    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        printf("Error opening file: %s\n", argv[1]);
        return 1;
    }
    yylex();
    fclose(yyin);
    return 0;
}

/*
lex hexa-to-deci.l
gcc lex.yy.c
./a.out input.txt
*/


/*input.txt
4A 3 1 AA
*/
