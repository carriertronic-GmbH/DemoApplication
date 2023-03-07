import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/General/"
import "qrc:/qml/Dashboard/"
//import QtQuick.VirtualKeyboard 2.15

ApplicationWindow {
    id: window
    width: 1280
    height: 800
    visible: true
    visibility: "FullScreen"
    title: qsTr("Carrier Tronic Demo")

    //Properties
    property string pageTitle: qsTr("START MENU")

    //Main Layout
    Item{
        anchors.fill: parent

        MainHeader{
            id: header
            anchors.left: parent.left
            anchors.right: parent.right
            height: 100
        }

        StackView{
            id: stackview
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: header.bottom
            anchors.bottom: parent.bottom
            initialItem: Dashboard{}
        }
    }

    MouseArea {
	cursorShape: Qt.BlankCursor
   }

    //Virtual Keyboard
    /*InputPanel{
        id: virtualKeyboard
        width: parent.width
        y: Qt.inputMethod.visible ? parent.height - height : parent.height

        Behavior on y{
            NumberAnimation{
                duration: 650
                easing.type: "OutQuint"
            }
        }
    }*/
}
