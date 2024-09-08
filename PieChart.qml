import QtQuick
import QtQuick.Shapes

ListView {
    id: pieChartID

    interactive: false

    property string borderColor

    delegate: Shape {
        id: pieCharDelegateID

        width: 0
        height: 0

        property double anglePrev: 2 * Math.PI * piePrev
        property double angleCurrent: 2 * Math.PI * pieValue
        property double pieRadius: pieChartID.height / 2 - 20

        Behavior on anglePrev {
            NumberAnimation { duration: 300 }
        }

        Behavior on angleCurrent {
            NumberAnimation { duration: 300 }
        }

        ShapePath {
            strokeColor: borderColor
            strokeWidth: 0

            fillColor: pieColor

            startX: pieChartID.width / 2
            startY: pieChartID.height / 2

            PathLine {
                x: pieChartID.width / 2 + pieCharDelegateID.pieRadius * Math.sin(pieCharDelegateID.anglePrev)
                y: pieChartID.height / 2 + pieCharDelegateID.pieRadius * Math.cos(pieCharDelegateID.anglePrev - Math.PI)
            }

            PathArc {
                x: pieCharDelegateID.angleCurrent < Math.PI
                   ? pieChartID.width / 2 + pieCharDelegateID.pieRadius * Math.sin(pieCharDelegateID.angleCurrent)
                   : pieCharDelegateID.anglePrev < Math.PI
                     ? pieChartID.width / 2
                     : pieChartID.width / 2 + pieCharDelegateID.pieRadius * Math.sin(pieCharDelegateID.anglePrev)

                y: pieCharDelegateID.angleCurrent < Math.PI
                   ? pieChartID.height / 2 + pieCharDelegateID.pieRadius * Math.cos(pieCharDelegateID.angleCurrent - Math.PI)
                   : pieCharDelegateID.anglePrev < Math.PI
                     ? pieChartID.height / 2 + pieCharDelegateID.pieRadius
                     : pieChartID.height / 2 + pieCharDelegateID.pieRadius * Math.cos(pieCharDelegateID.anglePrev - Math.PI)

                radiusX: pieCharDelegateID.pieRadius
                radiusY: pieCharDelegateID.pieRadius
            }

            PathArc {
                x: pieChartID.width / 2 + pieCharDelegateID.pieRadius * Math.sin(pieCharDelegateID.angleCurrent)
                y: pieChartID.height / 2 + pieCharDelegateID.pieRadius * Math.cos(pieCharDelegateID.angleCurrent - Math.PI)
                radiusX: pieCharDelegateID.pieRadius
                radiusY: pieCharDelegateID.pieRadius
            }

            PathLine {
                x: pieChartID.width / 2
                y: pieChartID.height / 2
            }
        }
    }
}
