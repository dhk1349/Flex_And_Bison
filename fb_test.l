%%
"+" {printf("PLUS\n");}
"-" {printf("MINUS\n");}
"*" {printf("TIMES\n");}
"/" {printf("DIVIDE\n");}
"|" {printf("ABS\n");}
[0-9]+ {printf("NUMBER\n");}
\n {printf("NEWLINE\n");}
[ \t] {}
. {printf("MYSTERIOUS CHARICTIER %c\n", yytext);}
%%
