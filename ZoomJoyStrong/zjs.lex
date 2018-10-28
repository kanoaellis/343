%{
	#include <stdio.h>
	void printLexeme();
	int lineNum = 1;
%}

%option noyywrap

%%

END		{printf("END"); printLexeme();}
;		{printf("END_STATEMENT"); printLexeme();}
POINT		{printf("POINT"); printLexeme();}
LINE		{printf("LINE");printLexeme();}
CIRCLE		{printf("CIRCLE"); printLexeme();}
RECTANGLE	{printf("RECTANGLE"); printLexeme();}
SET_COLOR	{printf("SET_COLOR"); printLexeme();}
[0-9]+		{printf("INT"); printLexeme();}
[0-9]+\.[0-9]+	{printf("FLOAT"); printLexeme();}
[ \t]+		;
(\n)		{lineNum++;}
.		{printf("INVALID AT LINE %d", lineNum); printLexeme();}

%%

void printLexeme(){
	printf("\t(%s)\n", yytext);
}

int main(int argc, char** argv){
	yylex();
	return 0;
}
