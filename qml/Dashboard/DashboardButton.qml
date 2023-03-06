import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/General/"

Item {
    id: root

    //Properties
    property alias text: label.text
    property alias imageIcon: imageIconComponent.imageIcon
    property alias materialIcon: imageIconComponent.materialIcon

    //Signal
    signal clicked()

    Rectangle{
        anchors.fill: parent
        color: "#323232"

        ColumnLayout{
            anchors.centerIn: parent

            Icon{
                id: imageIconComponent
                Layout.alignment: Qt.AlignHCenter
                materialIconColor: Material.accent
            }
            Label{
                id: label
                text: qsTr("Title")
                font.pointSize: Qt.application.font.pointSize+10
                font.weight: Font.Bold
            }
        }
    }

    Button{
        anchors.fill: parent
        flat: true
        topInset: 0
        bottomInset: 0

        onClicked: {
            root.clicked()
        }
    }
}
