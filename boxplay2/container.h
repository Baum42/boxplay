#ifndef CONTAINER_H
#define CONTAINER_H

#include <QObject>
#include <QQmlListProperty>

class Container : public QObject
{
	Q_OBJECT

	Q_PROPERTY(QQmlListProperty<QObject> elements READ elements)
	Q_CLASSINFO("DefaultProperty", "elements")

public:
	explicit Container(QObject *parent = nullptr);

	QQmlListProperty<QObject> elements();

public slots:
	void printStatus();

private:
	QList<QObject*> _elements;
};

#endif // CONTAINER_H
