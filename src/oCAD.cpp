#include "oCAD.hpp"
int main() {}

void yyerror(QString msg) {
    qDebug() << "\n\n"
             << yyfile << ':' << yylineno << msg << '[' << yytext << "]\n\n";
    exit(-1);
}
