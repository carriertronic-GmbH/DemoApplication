#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFontDatabase>
#include "applicationbridge.h"

int main(int argc, char *argv[])
{
    qDebug() << "App started";
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    ApplicationBridge bridge;

    //NOTE Change this so QSettings can work properly
    app.setOrganizationName("Mastercom");
    app.setOrganizationDomain("Master.co");
    app.setApplicationName("CarrierTronicDemo");

    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-Black.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-BlackItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-Bold.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-BoldItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-Italic.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-Light.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-LightItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-Medium.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-MediumItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-Regular.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-Thin.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Roboto-ThinItalic.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/materialdesignicons-webfont.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/DINNextLTPro-Light.otf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/DINNextLTPro-Medium.otf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/DINNextLTPro-Regular.otf");

    QFontDatabase::addApplicationFont(":/resources/Fonts/Spartan-Black.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Spartan-Bold.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Spartan-ExtraBold.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Spartan-ExtraLight.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Spartan-Light.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Spartan-Medium.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Spartan-Regular.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Spartan-SemiBold.ttf");
    QFontDatabase::addApplicationFont(":/resources/Fonts/Spartan-Thin.ttf");


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("Bridge", &bridge);
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
