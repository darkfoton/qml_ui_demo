import QtQuick
import QtQuick.Shapes

ListView {
    id: stickChartID

    orientation: ListView.Horizontal
    spacing: 0
    interactive: false

    delegate: Shape
    {
        width: 0
        height: 0

        visible: index > 0

        ShapePath {
            strokeColor: pieColor
            strokeWidth: 4

            startX: (index - 0.5) * stickChartID.width  / stickChartID.count
            startY: stickChartID.height * (1.0 - valuePrev)

            PathLine {
                x: (index + 0.5) * stickChartID.width / stickChartID.count
                y: stickChartID.height * (1.0 - value)

                Behavior on y {
                    NumberAnimation { duration: 300 }
                }
            }

            Behavior on startY {
                NumberAnimation { duration: 300 }
            }
        }
    }
}
