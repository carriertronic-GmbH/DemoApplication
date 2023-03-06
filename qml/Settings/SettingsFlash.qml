import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/General/"

Item{
    id: root

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 48

        Label{
            id: label
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("FLASH TEZI")
            color: "white"
            font.pointSize: Qt.application.font.pointSize+10
            font.weight: Font.Bold
        }

        Rectangle{
            id: listview
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 350
            Layout.preferredHeight: 250
            color: "#323232"

            Icon{
                anchors.fill: parent
                anchors.margins: width*0.15
                width: 100
                height: 100
                imageIcon: "9042346_cloud_desync_icon dbb48c.png"
            }

            Button{
                anchors.fill: parent
                topInset: 0
                bottomInset: 0
                flat: true

                onClicked: {
                    Bridge.flashTEZI()
                }
            }
        }
    }
}
