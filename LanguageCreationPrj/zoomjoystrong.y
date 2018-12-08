%{
	#include <stdio.h>
	int yyerror(const char* err);
%}

%token END		
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

expr:	line x y u v
	|	point x y
	|	circle x y r
	|	rectangle x y w h
	|	set_color r g b
	|	EOL
	|	END
	;

%%

int main(int argc, char** argv) {
	yyparse();
}

int yyerror(const char* err) {
	printf("%s\n", err);
}