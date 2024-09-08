import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes

import UITestingApp

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("UI Demonstration")

    ApplicationModel {
        id: applicationModelID
    }

    RowLayout {
        anchors.fill: parent

        spacing: 0

        Rectangle {
            id: leftPanelID

            Layout.fillHeight: true
            implicitWidth: 0

            Behavior on implicitWidth {
                NumberAnimation { duration: 200 }
            }
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true

            spacing: 0

            Rectangle {
                Layout.fillWidth: true
                height: 40

                color: "lightgrey"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 5

                    ArrowButton {
                        Layout.fillHeight: true
                        implicitWidth: 30

                        arrowRotation: applicationModelID.leftPanelVisible
                                       ? 180
                                       : 0

                        onClicked: {
                            applicationModelID.leftPanelVisible = !applicationModelID.leftPanelVisible
                            leftPanelID.implicitWidth = applicationModelID.leftPanelVisible ? 200 : 0
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    ArrowButton {
                        Layout.fillHeight: true
                        implicitWidth: 30

                        arrowRotation: applicationModelID.rightPanelVisible
                                       ? 0
                                       : 180

                        onClicked: {
                            applicationModelID.rightPanelVisible = !applicationModelID.rightPanelVisible
                            rightPanelID.implicitWidth = applicationModelID.rightPanelVisible ? 200 : 0
                        }
                    }
                }
            }

            RowLayout {
                Layout.fillHeight: true
                Layout.fillWidth: true

                spacing: 0

                Rectangle {
                    Layout.fillHeight: true
                    width: 7

                    visible: leftPanelID.implicitWidth > 0

                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 0.0; color: "lightgrey" }
                        GradientStop { position: 1.0; color: "white" }
                    }
                }

                GridLayout {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: 10

                    columnSpacing: 10
                    rowSpacing: 10

                    columns: 2

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        color: "lightgrey"
                        clip: true

                        SlideControlArray {
                            anchors.fill: parent
                            anchors.margins: 10

                            model: applicationModelID.parametersList
                        }
                    }

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        color: "lightgrey"
                        clip: true

                        BarChart {
                            anchors.fill: parent
                            anchors.margins: 10

                            model: applicationModelID.parametersList
                            maxValue: applicationModelID.maxValue
                        }
                    }

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        color: "lightgrey"
                        clip: true

                        StickChart {
                            anchors.fill: parent
                            anchors.margins: 10

                            model: applicationModelID.parametersList
                        }
                    }

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        color: "lightgrey"
                        clip: true

                        PieChart
                        {
                            anchors.fill: parent
                            model: applicationModelID.parametersList
                            borderColor: "#444444"
                        }
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    width: 7

                    visible: rightPanelID.implicitWidth > 0

                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 0.0; color: "white" }
                        GradientStop { position: 1.0; color: "lightgrey" }
                    }
                }
            }
        }

        Rectangle {
            id: rightPanelID

            Layout.fillHeight: true
            implicitWidth: 0

            Behavior on implicitWidth {
                NumberAnimation { duration: 200 }
            }
        }
    }
}
