import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/General/"

Item {
    id: root

    //Properties
    property string backgroundColor: "#000000"

    //Signal
    signal clicked()

    Image {
        anchors.fill: parent
        visible: backgroundColor==="chess"
        source: "qrc:/resources/Images/chess-print.jpg"
        fillMode: Image.Tile
    }

    Rectangle{
        anchors.fill: parent
        color: backgroundColor==="chess" ? "transparent" : root.backgroundColor
        border.color: backgroundColor==="#000000" ? "darkgrey" : "transparent"

        ColumnLayout{
            anchors.centerIn: parent

            Label{
                text: qsTr("Fill Screen with")
                font.pointSize: Qt.application.font.pointSize+10
                font.weight: Font.Bold
            }
            Label{
                text: qsTr("color:")+" "+root.backgroundColor
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
