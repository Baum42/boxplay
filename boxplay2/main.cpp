#include <QCoreApplication>
#include <QQmlApplicationEngine>
#include "container.h"

int main(int argc, char *argv[])
{
	QCoreApplication app(argc, argv);

	qmlRegisterType<Container>("boxplay2", 1, 0, "Container");

	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	return app.exec();
}
