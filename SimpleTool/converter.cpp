#include "converter.h"
Converter::Converter(QObject* parent):QObject(parent) {  }

QString Converter::convert_from_to(QString input,int from,int to){
    QMap<int,int> from_index_to_mode;
    from_index_to_mode[BIN]=2;
    from_index_to_mode[DEC]=10;
    from_index_to_mode[HEX]=16;

    int from_mode=from_index_to_mode[from];
    int to_mode=from_index_to_mode[to];

    QString output;
    bool ok;
    output=QString::number(input.toULongLong(&ok,from_mode),to_mode);

    return output;
}
