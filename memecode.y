%{
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
  
extern FILE* yyin;
extern int yylineno;
 extern char* yytext;

 struct variable
 {
   char* name;
   char* type;
   char* scope;
   char* value;
   
 };
 struct variable Var[250];
 int v_count=0;
 
 struct function
 {
   char*type;
   char*name;
   char*arg;
 };
 struct function Func[100];
 int f_count=0;
 
 int i=0;
 int variable_already_declared(char* name)
 {
   int v_count1=f_count;
   while(v_count1!=0)
     {
       if (strcmp(Var[v_count1].name, name) == 0) {return -1;
	 i=v_count1;}
       v_count1--;
     }
   return 1;
 }

 void output_all_table()
 {
   FILE* f = fopen("symbol_table.txt", "w");
   fprintf(f, "Acest fisier este in lucru\n--------------------\n\n");
   fprintf(f, "Variabilele declarate sunt:\n");
   for(i=0;i<v_count;i++)
     {
       fprintf(f, "Nume - %s | Tip -  %s | Locul declararii - Nu e gata | Valoare - Nu e gata\n",Var[i].name, Var[i].type);
     }
   fprintf(f, "\n\nFunctiile declarate sunt:\n");
   for(i=0;i<f_count;i++)
     {
       fprintf(f, "Nume - %s | Tip -  %s | Tipul argumentelor - [%s] | Numele Argumentelor - NU e gata | Locul declararii - Nu e gata\n",Func[i].name, Func[i].type, Func[i].arg);
     }
   fclose(f);
 }
 
 void declare_new_variable(char*type,char*name)
 {
   if(variable_already_declared(name)!=1)
     {
       char error[100];
       sprintf(error,"Variabila %s este deja declarata",name);
       yyerror(error);
     }
   else
     {
       Var[v_count].type=type;
       Var[v_count].name=name;
       v_count++;
     }
 }
 
 void Evalvar(char*nume)
 {if (variable_already_declared(nume)==1)
     {char error[100];
       sprintf(error,"Variabila %s este deja declarata",nume);
       yyerror(error);
     }
   else
     {if(strcmp(Var[i].type,"NUMBER")!=0)
	 {
	   char error[100];
	   sprintf(error,"Variabila %s nu este de tip NUMBER",nume);
	   yyerror(error);
	 }
     }
 }
 
 int function_already_declared(char*name,char*arg)
 {
   int f_count1=f_count;
   while(f_count1!=0)
     {
       if(strcmp(Func[f_count1].name,name)==0&&strcmp(Func[f_count1].arg,arg)==0)
	 {return -1;}
       f_count1--;}
   return 1;
 }
 
 void declare_new_function(char*type,char*name,char*arg)
 {
   if(function_already_declared(name,arg)!=1)
     {
       char error[100];
       sprintf(error,"Functia %s este deja declarata",name);
       yyerror(error);
     }
   else
     {
       Func[f_count].type=type;
       Func[f_count].name=name;
       Func[f_count].arg=arg;
       f_count++;
     }
 }
 
 int j=0;
 void call_declared_function(char*name)
 {
   int f_count1=f_count;
   while(f_count1!=0)
     {
if(strcmp(Func[f_count1].name,name)==0)
  {
    j=f_count1;}
 f_count1--;
     }
   if(j==0)
     {
       char error[100];
sprintf(error,"Functia %s nu este declarata",name);
 yyerror(error);}
 }
 
 void assign(char*name1,char*name2)
 {
   if(variable_already_declared(name1)==1)
    {char error[100];
      sprintf(error,"Variable %s is not  declared",name1);
      yyerror(error);
    }
   if(variable_already_declared(name2)==1)
    {char error[100];
      sprintf(error,"Variable %s is not  declared",name2);
      yyerror(error);
    }
  char*type1;
  char*type2;
 if(variable_already_declared(name1)==-1)
   {
     strcpy(type1,Var[i].type);}
 if(variable_already_declared(name2)==-1)
   {
     strcpy(type2,Var[i].type);
   }
 
 if(variable_already_declared(name1)==1&&variable_already_declared(name2)==1)
   {
     if(strcmp(type1,"NUMBER")==0&&strcmp(type2,"NR")!=0&&strcmp(type2,"NUMB")!=0)
       {char error[100];
sprintf(error,"Wrong assign: %s of type %s = %s of type %s",name1,type1,name2,type2 );
 yyerror(error);
       }
     if(strcmp(type1,"FLOATY")==0&&strcmp(type2,"FLOAT")!=0&&strcmp(type2,"FFLOATY")!=0)
       {char error[100];
	 sprintf(error,"Wrong assign: %s of type %s = %s of type %s",name1,type1,name2,type2 );
yyerror(error);
       }
     if(strcmp(type1,"CHARACTER")==0&&strcmp(type2,"CHAR")!=0&&strcmp(type2,"CHHAR")!=0)
{char error[100];
  sprintf(error,"Wrong assign: %s of type %s = %s of type %s",name1,type1,name2,type2 );
  yyerror(error);
 }
     if(strcmp(type1,"BOLL")==0&&strcmp(type2,"binary")!=0&&strcmp(type2,"BOOL")!=0)
       {char error[100];
sprintf(error,"Wrong assign: %s of type %s = %s of type %s",name1,type1,name2,type2 );
 yyerror(error);
       }
     if(strcmp(type1,"TEXT")==0&&strcmp(type2,"STRING")!=0&&strcmp(type2,"TXT")!=0)
{char error[100];
  sprintf(error,"Wrong assign: %s of type %s = %s of type %s",name1,type1,name2,type2 );
  yyerror(error);
 }
   }
}
 int found=0;
 char *token[50];
 char *token1[50];
 
 char variable(char*name)
 {
   for(int k=0 ;k<=v_count;k++)
     {
       if(strcmp(name,Var[k].name)==0) {found=k;}
     }
   char *type;
   if(found!=0)
     {
       strcpy(type,Var[found].type);
     }
   return type;
 }

int c=0,d=0;
/*void function_param(char*name,char *arg)
{
for(int k=0;k<=f_count;k++)
{
if(strcmp(name,Func[k].name)==0 { found=k;}
}
char*type;
if(found!=0)
{
strcpy(type,Func[found].type);
}
token1[d]=strtok(Func[found].arg,",");
   	while(token1[d]!=NULL)
   {
        d=d+1;
         token1[d]=strtok(NULL,",");
       }
token1[d]=strtok(token[0],"(");
token1[d-1]=strtok(token1[d-1],")");
while(token1[d]!=NULL)
   {
        d=d+1;
         token1[d]=strtok(NULL,"(");
       }
       token1[0]=token[d-1];
token[c]=strtok(arg,",");
   	while(token[c]!=NULL)
   {
        c=c+1;
         token[c]=strtok(NULL,",");
       }
       token[c-1]=strtok(token[c-1],")");
token[c]=strtok(token[0],"(");
token[c-1]=strtok(token[c-1],")");
while(token[c]!=NULL)
   {
        c=c+1;
         token[c]=strtok(NULL,"(");
       }
       token[0]=token[c-1];


}*/

%}

%token FILEBEGIN FILEEND INCLLINE INCLUDE OUTPUT ENDLINE
%token DECLARATION
%token OBJBGN OBJINITTYPE OBJDECL NEWOBJVAL

%token TYPE ID

%token FUNCBGN FUNCRETURN FUNCEND FUNCCALL MFUNCBGN
%token EVAL
%token CLASSBGN CLASSEND POPEN PCLOSE

%token NR STRING CONST BINARY CHAR 
%token ARRAY
%token STRINGF
%token SUM DIFF MOD DIV MUL ASSIGN
%token ARITH BOOL COMPARISON

%token WHILEBGN WHILEEND
%token IFSTMT IFCORRECT ELSEIF ELSE

%start program

%left SUM DIFF
%left MUL DIV

%union
 {
   int num;
   char* string;
}

%type <num> NR expression
%type <string> TYPE ID param paramlist

%%

program: FILEBEGIN programorder FILEEND {printf ("[Succes] Program sintactic corect!\n");output_all_table();}
 ;

programorder : includesection globalscopelist mainfunction
             | includesection mainfunction
             | globalscopelist mainfunction
             | mainfunction
             ;

includesection : INCLLINE INCLUDE ENDLINE
               | includesection INCLLINE INCLUDE ENDLINE
               ;

mainfunction : MFUNCBGN localscopelist FUNCEND
             ;


globalscopelist : globalscope
                | globalscopelist globalscope
                ;

globalscope : vardeclaration ENDLINE
            | constdeclaration ENDLINE
            | arraydeclaration ENDLINE
            | functiondeclaration
            | objdeclaration
            | classdeclaration
            | equation ENDLINE
            | stringfunction ENDLINE 
            | OUTPUT equation ENDLINE
            | eval
            ;

localscopelist : localscope
               | localscopelist localscope
               ;

localscope : vardeclaration ENDLINE
           | constdeclaration ENDLINE
           | arraydeclaration ENDLINE
           | equation ENDLINE
	   | OUTPUT equation ENDLINE
     	   | callfunction ENDLINE
	   | FUNCRETURN equation ENDLINE
           | loop
           | if
           | eval
           ;

vardeclaration : DECLARATION TYPE ID {declare_new_variable($2,$3);printf("%s %s\n",$2,$3);}
               | DECLARATION TYPE ID ASSIGN expression {declare_new_variable($2,$3);}
               ;

constdeclaration : DECLARATION CONST TYPE ID ASSIGN expression {declare_new_variable($3,$4);}
                 ;

arraydeclaration : DECLARATION ARRAY TYPE ID
                 | DECLARATION ARRAY TYPE ID ASSIGN '[' arrayvalues ']'
                 ;

objdeclaration : OBJBGN ID
               | ID OBJDECL ID OBJINITTYPE TYPE ENDLINE
               | DECLARATION ID NEWOBJVAL ID ENDLINE
               ;



functiondeclaration : FUNCBGN TYPE ID paramlist localscopelist FUNCEND {printf("%s %s %s\n",$2, $3, $4);
                                                                        declare_new_function($2,$3,$4);}
                    | FUNCBGN TYPE ID paramlist FUNCEND {printf("%s %s %s\n",$2, $3, $4);
                                                         declare_new_function($2,$3,$4);}
                    ;

classdeclaration : CLASSBGN localscope CLASSEND
                 ;


stringfunction : STRINGF ID stringlist
                ;

stringlist : ID ID
           | STRING STRING
           | STRING ID 
           | ID STRING
           ;

arrayvalues : expression
            | arrayvalues ',' expression
            ;
         

paramlist : POPEN PCLOSE {$$=malloc(256); $$[0] = 0;}
          | POPEN param PCLOSE {$$=$2;}
          ;

param : TYPE ID {$$=$1;}
| param ',' param {$$=$1; strcat($$, ","); strcat($$, $3);}
;

argumentlist: argumenteq 
            | argumentlist ',' argumenteq
            ; 


argumenteq : ARITH argumenteq argumenteq 
           | argumenteq COMPARISON argumenteq 
           | callfunction 
           | '(' argumenteq ')'
           | NR 
           | ID 
           ;

            
eval: FUNCCALL EVAL '(' expression ')' {printf("value of exp %d",$4);}
    ;

equation : ID ASSIGN expression
         ;

expression: SUM expression expression {$$=$2+$3;}
   | DIFF expression expression {$$=$2-$3;}
   | MUL expression expression {$$=$2*$3;}
   | DIV expression expression {$$=$2/$3;}
   | MOD expression expression {$$=$2%$3;}
   | '(' expression ')' {$$=$2;}
   | NR {$$=$1;}
   | ID {Evalvar($1);$$=$1;}



           

callfunction : FUNCCALL ID '(' argumentlist ')' {call_declared_function($2);}
             | FUNCCALL ID '(' ')'{call_declared_function($2);}
             ;



compare : compare COMPARISON compare 
           | ARITH compare compare
           | '(' compare ')'
           | ID  {printf("enter expression\n");}
           | NR
           ; 

loop : WHILEBGN '(' compare ')' localscope WHILEEND
     ;

if : IFSTMT '(' compare ')' IFCORRECT localscope otherif
   | IFSTMT '(' compare ')' IFCORRECT localscope
   ;

otherif : ELSEIF '(' compare ')' localscope
        | otherif ELSE localscope
        | ELSE localscope
        | otherif ELSEIF '(' compare ')' localscope
        ;





%%
int yyerror(char * s){
  printf("[%d] Eroare:  %s\n",yylineno,s);
}

int main(int argc, char** argv){
 yyin=fopen(argv[1],"r");
 yyparse();
} 
