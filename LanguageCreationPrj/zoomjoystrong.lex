%{
	#include "zoomjoystrong.tab.h"
%}

%option noyywrap

%%

END				return END;
;				return END_STATEMENT;
POINT			return POINT;
LINE			return LINE;
CIRCLE			return CIRCLE;
RECTANGLE		return RECTANGLE;
SET_COLOR		return SET_COLOR;
[0-9]+			return INT;
[0-9]+\.[0-9]+	return FLOAT;
[ \t\n]+		;
.				printf("ERROR");

%%
