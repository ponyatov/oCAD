#pragma once

#include <QString>
#include <QDebug>

struct Object {
    Object();
    virtual ~Object();
};

extern int yylex();
extern char *yytext;
extern char *yyfile;
extern int yylineno;
extern void yyerror(QString msg);
extern int yyparse();
