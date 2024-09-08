import QtQuick
import QtQuick.Controls

Button {
    property int arrowRotation: 0

    Item {
        anchors.fill: parent
        anchors.margins: 5

        rotation: arrowRotation

        clip: true

        Rectangle {
            x: 2
            y: parent.height / 2 + 3

            width: 18
            height: 4

            rotation: -45
        }

        Rectangle {
            x: 2
            y: 3

            width: 18
            height: 4

            rotation: 45
        }
    }
}
