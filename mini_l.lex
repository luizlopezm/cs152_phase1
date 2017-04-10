%{   
   int Line = 1, Pos = 1;
%}

%%
   /*Arithmetic Operators*/

"-"   {printf("SUB\n");     Pos += yyleng;}
"+"   {printf("ADD\n");     Pos += yyleng;}
"*"   {printf("MULT\n");    Pos += yyleng;}
"/"   {printf("DIV\n");     Pos += yyleng;}
"%"   {printf("MOD\n");     Pos += yyleng;}

   /*Comparision Operators*/
"=="  {printf("EQ\n");     Pos += yyleng;}
"<>"  {printf("NEQ\n");    Pos += yyleng;}
"<"   {printf("LT\n");     Pos += yyleng;}
">"   {printf("GT\n");     Pos += yyleng;}
"<="  {printf("LTE\n");    Pos += yyleng;}
">="  {printf("GTE\n");    Pos += yyleng;}

   /*Reserved Words*/
"function"          {printf("FUNCTION\n");        Pos += yyleng;}
"beginparams"     {printf("BEGIN_PARAMS\n");    Pos += yyleng;}
"endparams"       {printf("END_PARAMS\n");      Pos += yyleng;}
"beginlocals"     {printf("BEGIN_LOCALS\n");    Pos += yyleng;}
"endlocals"       {printf("END_LOCALS\n");      Pos += yyleng;}
"beginbody"       {printf("BEGIN_BODY\n");      Pos += yyleng;}
"endbody"         {printf("END_BODY\n");        Pos += yyleng;}
"integer"         {printf("INTEGER\n");         Pos += yyleng;}
"array"           {printf("ARRAY\n");           Pos += yyleng;}
"of"              {printf("OF\n");              Pos += yyleng;}
"if"              {printf("IF\n");              Pos += yyleng;}
"then"            {printf("THEN\n");            Pos += yyleng;}
"endif"           {printf("ENDIF\n");           Pos += yyleng;}
"else"            {printf("ELSE\n");            Pos += yyleng;}
"while"           {printf("WHILE\n");           Pos += yyleng;}
"do"              {printf("DO\n");              Pos += yyleng;}
"beginloop"       {printf("BEGINLOOP\n");       Pos += yyleng;}
"endloop"         {printf("ENDLOOP\n");         Pos += yyleng;}
"continue"        {printf("CONTINUE\n");        Pos += yyleng;}
"read"            {printf("READ\n");            Pos += yyleng;}
"write"           {printf("WRITE\n");           Pos += yyleng;}
"and"             {printf("AND\n");             Pos += yyleng;}
"or"              {printf("OR\n");              Pos += yyleng;}
"not"             {printf("NOT\n");             Pos += yyleng;}
"true"            {printf("TRUE\n");            Pos += yyleng;}
"false"           {printf("FALSE\n");           Pos += yyleng;}
"return"          {printf("RETURN\n");          Pos += yyleng;}

   /*Indentifiers and numbers*/

(\.[0-9]+)|([0-9]+(\.[0-9]*)?([eE][+-]?[0-9]+)?)   {printf("NUMBER %s\n", yytext); Pos += yyleng;}

[A-Za-z](([A-Za-z]|[0-9]|_)*([A-Za-z]|[0-9]))?     {printf("INDENT %s\n", yytext); Pos += yyleng;}

   /*Speacial Cases*/
";"   {printf("SEMICOLON\n");            Pos += yyleng;}
":"   {printf("COLON\n");                Pos += yyleng;}
","   {printf("COMMA\n");                Pos += yyleng;}
"("   {printf("L_PAREN\n");              Pos += yyleng;}
")"   {printf("R_PAREN\n");              Pos += yyleng;}
"["   {printf("L_SQUARE_BRACKET\n");     Pos += yyleng;}
"]"   {printf("R_SQUARE_BRACKET\n");     Pos += yyleng;}
":="  {printf("ASIGN\n");                Pos += yyleng;}

"\n"           {Line++; Pos = 1;} /*Clean Up*/
[ \t]+         {Pos += yyleng;}
.              {printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", Line, Pos, yytext); exit(0);}
##.*            {Pos += yyleng;} /*Clean Up COMMENT*/
%%

int main(int argc, char ** argv)
{
   if(argc >= 2)
   {
      yyin = fopen(argv[1], "r");
      if(yyin == NULL)
      {
         yyin = stdin;
      }
   }
   else
   {
      yyin = stdin;
   }
   yylex();
}
