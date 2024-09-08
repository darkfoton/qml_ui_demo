import QtQuick

ListView {
    id: barChartID

    orientation: ListView.Horizontal
    spacing: 10
    interactive: false

    property double maxValue: 1.0

    delegate: Item {
        height: parent.height
        width: (barChartID.width - ((barChartID.count - 1) * 10)) / barChartID.count

        Rectangle {
            x: 0
            y: parent.height * (1.0 - value / maxValue)
            width: parent.width
            height: parent.height * value / maxValue

            color: pieColor

            Behavior on y {
                NumberAnimation { duration: 300 }
            }

            Behavior on height {
                NumberAnimation { duration: 300 }
            }
        }
    }
}
