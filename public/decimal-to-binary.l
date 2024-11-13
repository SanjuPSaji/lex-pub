%{
/* Definition section */
#include<stdio.h> 
#include<string.h>

int num, r;
char binary[32];  /* Array to store binary representation */
%}

DIGIT [0-9]

%% 
{DIGIT}+ { 
    num = atoi(yytext); 

    /* Reset binary string for each new number */
    memset(binary, 0, sizeof(binary)); 

    int index = 0;

    if (num == 0) {
        binary[index++] = '0';  // Special case for 0
    } else {
        /* Convert decimal to binary */
        while (num > 0) { 
            r = num % 2; 
            binary[index++] = r + '0';  // Store as character '0' or '1'
            num /= 2; 
        }
    }

    /* Reverse the binary string */
    for (int i = 0; i < index / 2; i++) {
        char temp = binary[i];
        binary[i] = binary[index - i - 1];
        binary[index - i - 1] = temp;
    }

    /* Output the binary representation */
    printf("%s ", binary);
} 

.|\n ECHO; 

%% 

int yywrap(){
    return 1;
}

int main(int argc, char *argv[]) {   
    FILE *fp = fopen(argv[1], "r");
    yyin = fp;
    yylex(); 
    return 0; 
} 

/*
lex decimal-to-binary.l
gcc lex.yy.c
./a.out input.txt
*/
