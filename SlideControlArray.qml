import QtQuick

ListView {
    id: controlsListID

    spacing: 10
    interactive: false

    delegate: Rectangle {
        width: parent.width
        height: (controlsListID.height - ((controlsListID.count - 1) * 10)) / controlsListID.count

        Rectangle {
            x: 0
            y: 0
            height: parent.height
            width: value * parent.width

            color: pieColor
        }

        MouseArea {
            anchors.fill: parent

            onMouseXChanged: {
                var temp_value = mouseX / width
                value = temp_value > 1.0
                        ? 1.0
                        : temp_value < 0
                          ? 0.0
                          : temp_value
            }
        }
    }
}
