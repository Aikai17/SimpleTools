#include "urlencoder.h"

Urlencoder::Urlencoder(QObject* parent):QObject(parent) {}

QString Urlencoder::encode(QString input){
    QUrl url(input);
    QByteArray temp;
    temp=url.toPercentEncoding(input);
    QString output(temp);
    return output;
}
QString Urlencoder::decode(QString input){
    QUrl url(input);
    QByteArray data=input.toUtf8();
    QString output=QUrl::fromPercentEncoding(data);
    return output;
}
