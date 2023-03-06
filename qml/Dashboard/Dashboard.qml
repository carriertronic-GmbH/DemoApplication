import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: root

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 48

        RowLayout{
            DashboardButton{
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("DISPLAY")
                imageIcon: "9042859_pc_check_icon dbb84c.png"

                onClicked: {
                    root.StackView.view.push("qrc:/qml/DisplayTest/DisplayTest.qml")
                }
            }
            DashboardButton{
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("MULTITOUCH")
                imageIcon: "9042663_open_select_hand_gesture_icon dbb84c.png"

                onClicked: {
                    root.StackView.view.push("qrc:/qml/MultiTouch/MultiTouch.qml")
                }
            }
            DashboardButton{
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("DIASHOW")
                imageIcon: "9042787_media_image_list_icon dbb84c.png"

                onClicked: {
                    root.StackView.view.push("qrc:/qml/Diashow/Diashow.qml")
                }
            }
        }

        RowLayout{
            DashboardButton{
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("CAN")
                imageIcon: "9042946_share_android_icon dbb84c.png"

                onClicked: {
                    root.StackView.view.push("qrc:/qml/CAN/CAN.qml")
                }
            }
            DashboardButton{
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("RS232/RS485")
                materialIcon: "mdi-serial-port"

                onClicked: {
                    root.StackView.view.push("qrc:/qml/Terminal/Terminal.qml")
                }
            }
            DashboardButton{
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("SETTINGS")
                imageIcon: "9043007_settings_icon dbb84c.png"

                onClicked: {
                    root.StackView.view.push("qrc:/qml/Settings/Settings.qml")
                }
            }
        }
    }
}
