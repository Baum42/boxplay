#include "container.h"
#include <QDebug>

Container::Container(QObject *parent) :
	QObject(parent),
	_elements()
{}

QQmlListProperty<QObject> Container::elements()
{
	return QQmlListProperty<QObject>(this, _elements);
}

void Container::printStatus()
{
	foreach (auto element, _elements)
		qDebug() << element << element->parent();
}
