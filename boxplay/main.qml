import QtQuick 2.8
import QtQuick.Window 2.2
import Box2Dcore 2.0

Window {
	visible: true
	width: 640
	height: 480
	title: qsTr("Hello World")
	id: rootWindow

	Test {
		id: me
		parent: rootWindow.contentItem

		x: 100
		y: 10

		Rectangle {
			anchors.fill: parent
			color: "green"
		}
	}

	World {
		id: physicsWorld
		gravity: Qt.point(2, 4)

		pixelsPerMeter: 42
	}

	Rectangle {
		id: woodenBox
		color: "green"

		x: 10
		y: 10
		width: 42
		height: 42

		Rectangle {
			color: "blue"
			anchors.top: parent.top
			anchors.topMargin: box.y
			anchors.leftMargin: box.x
			anchors.left: parent.left
			height: 42
			width: 42
		}

		property int min: 1000
		property bool gogo: false
		onYChanged: {
			if(gogo || y > 200) {
				gogo = true;
				min = Math.min(y, min)
			}
		}

		onMinChanged: console.log(min)

		Body {
			id: boxBody

			bodyType: Body.Dynamic
			world: physicsWorld

			position: Qt.point(10, 10)
			onPositionChanged: {
				woodenBox.x = position.x
				woodenBox.y = position.y
			}

			Box {
				id: box
				density: 1
				friction: 1.0
				restitution: 1

				x: 42
				y: 42
				width: woodenBox.width
				height: woodenBox.height
			}
		}
	}

	Rectangle {
		id: ground
		height: 20
		anchors { left: parent.left; right: parent.right; bottom: parent.bottom }
		color: "red"

		Body {
			id: body

			world: physicsWorld
			position: Qt.point(ground.x, ground.y)

			Box {
				width: ground.width
				height: ground.height
			}
		}
	}
}
