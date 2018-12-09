%{
	#include <stdio.h>
	int yylex();	
	int yyerror(const char* err);
%}

%token END
%token END_STATEMENT		
%token POINT		
%token LINE		
%token CIRCLE		
%token RECTANGLE	
%token SET_COLOR	
%token INT	
%token FLOAT

%%

program:	list_of_expr
	;

list_of_expr:	expr
	|	list_of_expr expr
	;

expr:	LINE INT INT INT INT
	|	POINT INT INT
	|	CIRCLE INT INT INT
	|	RECTANGLE INT INT INT
	|	SET_COLOR INT INT INT
	|	END_STATEMENT
	|	END
	;

%%

int main(int argc, char** argv) {
	yyparse();
}

int yyerror(const char* err) {
	printf("%s\n", err);
}
