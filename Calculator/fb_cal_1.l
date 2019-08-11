/*
This is file is for flex extension.
Flex is scanning program that is frequently used with Bison(parsing program). By using "Flex & Bison", it is possible to make a compiler. To be more general, Flex & Bison is program for processing "Structured input data". One of the most famous example is making calculator program. Calculator can be made with Flex & Bison since calculator has structrued input (Operator and operand)
C code operates well in both Flex and Bison ext files.

Following file is flex file for building simple calculator

Flex file has three sections
1. Declaration and option settings
2. Lists of patterns and actions
3. C code for operation and scanner routine

Each part is divided with "%%"
*/

%{
/*
First part

<filename>.tab.h is made when making compiling flex and bison files to executable file. 
C codes should be in the %{ <type your codes here> %}section. 
*/

//Following file is included to finish 
#include "fb_cal_1.tab.h"
//"yylval" is declared to assign numbers for calculating process.
int yylval;
%}

%%

 /*
 Second part classifies structured input into predefined  
 categories. In this case, symbols are classified into 
 several operators and numbers.
 
 Input will turn into tokens with rules in this ssection.  
 (Just like enum in the C language)
 Each token get its exclusive token number in the bison 
 file automatically (starting from 258).
 
 Left-hand side (scope of each category) can be expressed 
 with regular-expression. 
 
 +, -, *, /, | return ADD, SUB, MUL, DIV, ABS respectively.
 
 [0-9]+ means multiple digit numbers in regular 
 expression. Data that fits this category will return 
 NUMBER and number will be stored in yylval. 
 \n returns End of Line.
 white space are set to return nothing. 
 Rest of characters should return nothing and print on 
 screen.
 */
 
"+"	{return ADD;}
"-" 	{return SUB;}
"*" 	{return MUL;}
"/" 	{return DIV;}
"|" 	{return ABS;}
[0-9]+	{yylval=atoi(yytext);return NUMBER;}
\n		{return EOL;}
[ \t]		{}
.		{printf("Mysterious char %c\n",*yytext);}

%%

/*
At third part, user can implement C code and use scanned info with C code. 
Since Bison has main function, removed main function in this file.
*/

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
