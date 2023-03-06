import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: root
    title: qsTr("CAN")

    //Properties
    property string lastPageTitle: ""

    Component.onCompleted: {
        lastPageTitle= window.pageTitle
        window.pageTitle= root.title
    }

    Component.onDestruction: {
        window.pageTitle= lastPageTitle
    }

    RowLayout{
        anchors.fill: parent

        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.margins: 84
            color: "#323232"

            Label{
                anchors.centerIn: parent
                text: qsTr("CAN\nGENERATOR")
                horizontalAlignment: "AlignHCenter"
                font.pointSize: Qt.application.font.pointSize+10
                font.weight: Font.Bold
            }

            Button{
                anchors.fill: parent
                topInset: 0
                bottomInset: 0
                flat: true

                onClicked: {
                    Bridge.cangen()
                }
            }
        }

        ColumnLayout{
            Rectangle{
                Layout.preferredHeight: 100
                Layout.fillWidth: true
                Layout.topMargin: 84
                Layout.rightMargin: 84
                Layout.leftMargin: 84
                color: "#323232"

                Label{
                    anchors.centerIn: parent
                    text: qsTr("CAN\nDUMP")
                    horizontalAlignment: "AlignHCenter"
                    font.pointSize: Qt.application.font.pointSize+10
                    font.weight: Font.Bold
                }

                Button{
                    anchors.fill: parent
                    topInset: 0
                    bottomInset: 0
                    flat: true

                    onClicked: {
                        var candumpResult= Bridge.candump()
                        candumpComponent.text= candumpResult
                    }
                }
            }
            CANDump{
                id: candumpComponent
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.rightMargin: 84
                Layout.leftMargin: 84
                Layout.bottomMargin: 84

                text: qsTr("No Content, waiting for user request")
            }
        }
    }
}
