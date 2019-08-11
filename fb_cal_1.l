%{
#include "fb_cal_1.tab.h"

int yylval;
%}

%%

"+"	{return ADD;}
"-" 	{return SUB;}
"*" 	{return MUL;}
"-" 	{return DIV;}
"|" 	{return ABS;}
[0-9]+	{yylval=atoi(yytext);return NUMBER;}
\n		{return EOL;}
[ \t]		{}
.		{printf("Mysterious char %c\n",*yytext);}

%%
/*
main(int argc, char** argv){
	int tok;
	//printf("Flex main function started\n");	
	while(tok=yylex()){
		printf("%d", tok);
		if(tok==NUMBER) printf(" = %d\n", yylval);
		else{printf("\n");}
	}
	//printf("Flex main function ended\n");
}*/
