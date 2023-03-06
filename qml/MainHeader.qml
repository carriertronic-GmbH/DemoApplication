import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/General/"

Item{
    id: root

    //Properties
    property real cpuTemperature: Bridge.cpuTempr
    property real gpuTemperature: Bridge.gpuTempr
    property real deviceTemperature: Bridge.deviceTempr

    RowLayout{
        anchors.fill: parent

        Item{
            Layout.preferredWidth: 84
            Layout.preferredHeight: 84

            Image {
                width: parent.width
                height: parent.height
                visible: stackview.depth === 1
                fillMode: Image.PreserveAspectFit
                source: "qrc:/resources/Icons/carriertronicLogo-6.png"
                mipmap: true
            }

            IconButton{
                width: parent.width
                height: parent.height
                visible: stackview.depth > 1
                materialIcon: "mdi-chevron-left"
                materialIconColor: "white"
                iconRealScale: 0.6

                onClicked: {
                    stackview.pop()
                }
            }
        }

        Label{
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: window.pageTitle
            fontSizeMode: Label.Fit
            minimumPointSize: 12
            font.pointSize: 128
            topPadding: 24
            bottomPadding: 24
            verticalAlignment: "AlignVCenter"
            font.weight: Font.Bold
        }

        RowLayout{
            ColumnLayout{
                Layout.fillHeight: true

                RowLayout{
                    Label{
                        text: qsTr("CPU Temperature:")
                        color: "white"
                        font.pointSize: Qt.application.font.pointSize+2
                    }
                }
                RowLayout{
                    Label{
                        text: qsTr("GPU Temperature:")
                        color: "white"
                        font.pointSize: Qt.application.font.pointSize+2
                    }
                }
                RowLayout{
                    Label{
                        text: qsTr("Device Temperature:")
                        color: "white"
                        font.pointSize: Qt.application.font.pointSize+2
                    }
                }
            }
            ColumnLayout{
                Layout.fillHeight: true

                RowLayout{
                    Label{
                        text: ((cpuTemperature.toFixed(1))/1000) + "°C"
                        color: Material.accent
                        font.pointSize: Qt.application.font.pointSize+2
                        font.weight: Font.Bold
                    }
                }
                RowLayout{
                    Label{
                        text: ((gpuTemperature.toFixed(1))/1000) + "°C"
                        color: Material.accent
                        font.pointSize: Qt.application.font.pointSize+2
                        font.weight: Font.Bold
                    }
                }
                RowLayout{
                    Label{
                        text: ((deviceTemperature.toFixed(1))/1000) + "°C"
                        color: Material.accent
                        font.pointSize: Qt.application.font.pointSize+2
                        font.weight: Font.Bold
                    }
                }
            }
        }

        Clock{
            Layout.leftMargin: 24
            Layout.rightMargin: 24
        }
    }

    Rectangle{
        anchors.bottom: parent.bottom
        width: parent.width
        height: 2
        color: "green"
    }
}
