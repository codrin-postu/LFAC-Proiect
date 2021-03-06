%{

#include <stdio.h>
#include "y.tab.h"

%}

%option noyywrap noinput nounput nodefault

%%

"JFYI"(.|\n)+"TL;DR" ;
"FYI"(.)* ;

"YO AM USING MEMECODE" {return FILEBEGIN;}
"BYE MATE!" {return FILEEND;}

"I NEEDS THIS" {return INCLLINE;}

"I GIVE" {yylval.string=strdup(yytext);return DECLARATION;}

"NUMBER"|"FLOATY"|"CHARACTER"|"TEXT"|"BOLL" {yylval.string=strdup(yytext);return TYPE;}
"CROWDY" {return ARRAY;}
"STATIONARY" {return CONST;}
"victory"|"failure" {return BINARY;}

"I AMZ CLASS" {return CLASSBGN;}
"I LEAV CLASS" {return CLASSEND;}

"AM HAVIN NEW OBJECT CALLD" {return OBJBGN;}

"IT IZ I EMPORTANT FUNCSON" {return MFUNCBGN;}

"HOW IZ I " {return FUNCBGN;}
"YU CAN HAV THIS" {return FUNCRETURN;}
"OKAY THEN" {return FUNCEND;}
"IZ" {return FUNCCALL;}

"Eval" {return EVAL;}

"HAVE" {return OBJDECL;}
"WICH ITZ" {return OBJINITTYPE;}
"ITZ NEW" {return NEWOBJVAL;}

"(" {return POPEN;}
")" {return PCLOSE;}



"IM IN YR LOOPZ WILE" {return WHILEBGN;}
"IM LEAVIN THIS LOOPZ" {return WHILEEND;}

"O IS IT RLY" {return IFSTMT;}
"YA RLY" {return IFCORRECT;}
"MEBBE IS" {return ELSEIF;}
"NO WAI" {return ELSE;}
"ITZ" {return ASSIGN;}

"SUM OF" {return SUM;}
"DIFF OF" {return DIFF;}
"PRODUCC OF" {return MUL;}
"DIVIDE OF" {return DIV;}
"MODE OF" {return MOD;}

"BIGGR1 OF"|"SMALLR1 OF" {return ARITH;}

"SMALLR"|"BIGGR"|"SAEM AN SMALLR"|"SAEM AN BIGGR"|"SAEM" {return COMPARISON;}

"BOTH OF"|"EITHER OF"|"NOT"|"ANY OF" {return BOOL;}

"COMBINN" {return STRINGF;}

"U CAN SEE" {return OUTPUT;}

[1-9][0-9]+|[0-9] {yylval.num=atoi(yytext);return NR;}

\"[a-zA-Z0-9 ]*\" {yylval.string=strdup(yytext);return STRING;}
\'[a-zA-Z0-9]\' {yylval.string=strdup(yytext);return CHAR;}

[A-Za-z][A-Za-z0-9]* {yylval.string=strdup(yytext);return ID;}
[a-zA-Z][A-Za-z0-9]*".lol" {return INCLUDE;}

"." {return ENDLINE;}

[ \t] ;
\n {yylineno++;}
. {return yytext[0];}

 
