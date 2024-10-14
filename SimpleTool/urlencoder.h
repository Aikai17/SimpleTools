#ifndef URLENCODER_H
#define URLENCODER_H
#include <QObject>
#include <QString>
#include <qqml.h>
class Urlencoder:public QObject
{
    Q_OBJECT
    QML_ELEMENT
    public:
        explicit Urlencoder(QObject* parent=nullptr);
        Q_INVOKABLE QString encode(QString input);
        Q_INVOKABLE QString decode(QString input);
};

#endif // URLENCODER_H
