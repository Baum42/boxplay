import QtQml 2.2
import Box2Dcore 2.0
import boxplay2 1.0

Container {
	id: rootWindow

	Component.onCompleted: printStatus();

	World {
		id: physicsWorld
		gravity: Qt.point(2, 4)

		pixelsPerMeter: 42
		running: false

		Component.onCompleted: physicsWorld.enableFastrun()
	}

	Timer {
		repeat: false
		running: true
		interval: 1000
		onTriggered: physicsWorld.running = true;
	}

	Body {
		id: boxBody

		bodyType: Body.Dynamic
		world: physicsWorld

		position: Qt.point(10, 10)
		onPositionChanged: console.log(position)

		Box {
			id: box
			density: 1
			friction: 1.0
			restitution: 1

			x: 42
			y: 42
			width: 42
			height: 42
		}
	}

	Body {
		id: body

		world: physicsWorld
		position: Qt.point(0, 200)

		Box {
			width: 1000
			height: 20
		}
	}
}
