

%{
	#include<stdio.h>
	#include "project.tab.h"
	#include<stdlib.h>
	extern int yylval;
%}

%%

[0-9]+	{ 
		yylval = atoi(yytext);
		return NUM;
	}

[a-z]	{
		yylval = *yytext - 'a';
		return	VAR;
	}
"start"	{return MAIN;}
[!][a-z]+[.][a-z]+   { return HEAD;}
"integer"	{return INT;}
"string"	{return CHAR;}
"float"	{return FLOAT; }
"double"	{return DOUBLE; }
"in_case"	{ return IF;	}
"or"	{ return ELSE;	}
"or_in_case"	{ return ELSIF;	}
"gcd"	{ return GCD;	}
"lcm"	{ return LCM;	}
"tan"	{ return TAN;	}
"log_e"	{ return LN;	}
"factorial"	{ return FACTORIAL;	}
"copy"	{ return PRINT;	}
"meanwhile"	{ return WHILE;	}
"option"    {return CASE;}
"test"  {return SWITCH;}
"stop"   {return BREAK;}
"auto" {return DEFAULT;}
"prime" { return PRIME;}
[-+/*<>=,();:{}] 	{
			yylval = yytext[0];
			return *yytext;
		}

[ \t\n]*	;
.	{
		yyerror("Unknown Character.\n");
	}
%%

main(){
	yyin = freopen("input.txt","r",stdin);
	yyout = freopen("output.txt","w",stdout);
	yyparse();
}