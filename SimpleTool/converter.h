#ifndef CONVERTER_H
#define CONVERTER_H
#include <QObject>
#include <QString>
#include <qqml.h>
class Converter:public QObject
{
    Q_OBJECT
    QML_ELEMENT
    public:
        explicit Converter(QObject* parent=nullptr);
        Q_INVOKABLE QString convert_from_to(QString input,int from,int to);
    private:
        enum {BIN,DEC,HEX};
};

#endif // CONVERTER_H
