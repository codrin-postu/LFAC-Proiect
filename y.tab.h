/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    FILEBEGIN = 258,
    FILEEND = 259,
    INCLLINE = 260,
    INCLUDE = 261,
    OUTPUT = 262,
    ENDLINE = 263,
    DECLARATION = 264,
    OBJBGN = 265,
    OBJINITTYPE = 266,
    OBJDECL = 267,
    NEWOBJVAL = 268,
    TYPE = 269,
    ID = 270,
    FUNCBGN = 271,
    FUNCRETURN = 272,
    FUNCEND = 273,
    FUNCCALL = 274,
    MFUNCBGN = 275,
    EVAL = 276,
    CLASSBGN = 277,
    CLASSEND = 278,
    POPEN = 279,
    PCLOSE = 280,
    NR = 281,
    STRING = 282,
    CONST = 283,
    BINARY = 284,
    CHAR = 285,
    ARRAY = 286,
    STRINGF = 287,
    SUM = 288,
    DIFF = 289,
    MOD = 290,
    DIV = 291,
    MUL = 292,
    ASSIGN = 293,
    ARITH = 294,
    BOOL = 295,
    COMPARISON = 296,
    WHILEBGN = 297,
    WHILEEND = 298,
    IFSTMT = 299,
    IFCORRECT = 300,
    ELSEIF = 301,
    ELSE = 302
  };
#endif
/* Tokens.  */
#define FILEBEGIN 258
#define FILEEND 259
#define INCLLINE 260
#define INCLUDE 261
#define OUTPUT 262
#define ENDLINE 263
#define DECLARATION 264
#define OBJBGN 265
#define OBJINITTYPE 266
#define OBJDECL 267
#define NEWOBJVAL 268
#define TYPE 269
#define ID 270
#define FUNCBGN 271
#define FUNCRETURN 272
#define FUNCEND 273
#define FUNCCALL 274
#define MFUNCBGN 275
#define EVAL 276
#define CLASSBGN 277
#define CLASSEND 278
#define POPEN 279
#define PCLOSE 280
#define NR 281
#define STRING 282
#define CONST 283
#define BINARY 284
#define CHAR 285
#define ARRAY 286
#define STRINGF 287
#define SUM 288
#define DIFF 289
#define MOD 290
#define DIV 291
#define MUL 292
#define ASSIGN 293
#define ARITH 294
#define BOOL 295
#define COMPARISON 296
#define WHILEBGN 297
#define WHILEEND 298
#define IFSTMT 299
#define IFCORRECT 300
#define ELSEIF 301
#define ELSE 302

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 280 "memecode.y" /* yacc.c:1909  */

   int num;
   char* string;

#line 153 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
