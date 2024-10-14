#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Aikai");
    app.setOrganizationDomain("");
    int id = QFontDatabase::addApplicationFont(":/fonts/Quicksand-Regular.otf");
    QString family = QFontDatabase::applicationFontFamilies(id).at(0);
    QFont font(family);
    app.setFont(font);
    QQmlApplicationEngine engine;

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Simple", "Main");

    return app.exec();
}
