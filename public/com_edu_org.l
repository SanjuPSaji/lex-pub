%{
#include <stdio.h>
%}

%%

.*com$ {
    printf("Line ends with 'com': %s \n", yytext);
}
.*org$ {
    printf("Line ends with 'org': %s \n", yytext);
}
.*edu$ {
    printf("Line ends with 'edu': %s \n", yytext);
}
. {
    // Ignore all other characters
}

\n {
    // Ignore newline characters
}

%%
int yywrap() {
    return 1;
}
int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (input_file == NULL) {
        printf("Error opening file: %s\n", argv[1]);
        return 1;
    }

    yyin = input_file;
    yylex();

    fclose(input_file);
    return 0;
}


/*
lex com_edu_org.l
gcc lex.yy.c
./a.out input.txt
*/

/*input.txt
fu.com
siu.org
siu.edu
deca.com
deca.cu
*/