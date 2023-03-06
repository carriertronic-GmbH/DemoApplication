import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    id: root
    title: qsTr("DISPLAY TEST")

    //Properties
    property string lastPageTitle: ""
    property string selectedColor: "white"

    Component.onCompleted: {
        lastPageTitle= window.pageTitle
        window.pageTitle= root.title
    }

    Component.onDestruction: {
        window.pageTitle= lastPageTitle
    }

    GridView{
        id: gridview
        anchors.fill: parent
        cellWidth: gridview.width/3
        cellHeight: gridview.height/2
        model: datamodel
        delegate: DisplayTestButton{
            scale: 0.95
            width: gridview.cellWidth
            height: gridview.cellHeight
            backgroundColor: color_

            onClicked: {
                selectedColor= color_
                loader.active= true
            }
        }
    }

    //Tester Loader
    Loader{
        id: loader
        active: false
        sourceComponent: Rectangle{
            anchors.fill: parent
            parent: Overlay.overlay
            color: selectedColor

            Image {
                anchors.fill: parent
                visible: selectedColor==="chess"
                source: "qrc:/resources/Images/chess-print.jpg"
                fillMode: Image.Tile
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    loader.active= false
                }
            }
        }
    }

    //Data models
    ListModel{
        id: datamodel
        ListElement{
            color_ : "#ff0000"
        }
        ListElement{
            color_ : "#00ff00"
        }
        ListElement{
            color_ : "#0000ff"
        }
        ListElement{
            color_ : "#ffffff"
        }
        ListElement{
            color_ : "#000000"
        }
        ListElement{
            color_ : "chess"
        }
    }
}
