import QtQuick 2.8

QtObject {
	id: objBox

	property alias parent: content.parent
	property alias x: content.x
	property alias y: content.y

	default property alias children: content.children

	property var _: Rectangle {
		id: content
		color: "red"
		width: 10
		height: 10
	}
}
