%{
    #include<stdio.h>
    int keywords = 0, comments = 0, spaces = 0, identifiers = 0, lines = 0;
    extern FILE *yyin;
%}


letter [a-zA-Z]
digit [0-9]
newline [\n]
space [ \t]
comment "//".*
keyword if|else|then|while|for|try|catch|do|char|int
identifier {letter}({letter}|{digit})*

%%

{keyword} { keywords++; }
{comment} { comments++; }
{space}   { spaces++; }
{newline} { lines++; }
{identifier} { identifiers++; }

";" { return 0; }
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

    printf("\nKeywords: %d\n", keywords);
    printf("Comments: %d\n", comments);
    printf("Spaces: %d\n", spaces);
    printf("Lines: %d\n", lines + 1); // +1 to account for the first line
    printf("Identifiers: %d\n", identifiers);
    printf("Words: %d\n", identifiers + keywords);

    fclose(fp);
    return 0;
}


/*
lex countToken.l
gcc lex.yy.c
./a.out input.txt
*/