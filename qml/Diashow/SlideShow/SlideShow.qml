import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.folderlistmodel 2.15
import "qrc:/qml/Dashboard/"

Page {
    id: root

    //Properties
    property int currentIndex: 0

    FolderListModel {
        id: folderModel
        nameFilters: ["*.jpg", "*.png"]
        caseSensitive: false
        showDirs: false
        folder : "file:///home/root/images/"
        onCountChanged: console.log(count)
    }

    Label{
        anchors.centerIn: parent
        text: "No image is available"
        font.pointSize: Qt.application.font.pointSize+3
        font.weight: Font.DemiBold
        visible: !folderModel.count
    }

    Rectangle{
        anchors.fill: parent
        parent: Overlay.overlay
        color: "black"

        Image{
            id: image
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    root.StackView.view.pop()
                }
            }
        }
    }

    //Animations
    SequentialAnimation{
        id: switchImage
        running: true
        loops: SequentialAnimation.Infinite

        NumberAnimation{
            target: image
            property: "opacity"
            to: 0
            duration: 350
        }
        ScriptAction{
            script: {
                image.source= folderModel.get(currentIndex, "fileUrl")
                if(currentIndex===(folderModel.count-1)){
                    currentIndex= 0
                }else{
                    currentIndex+=1
                }
            }
        }
        NumberAnimation{
            target: image
            property: "opacity"
            from: 0
            to: 1
            duration: 350
        }

        PauseAnimation {
            duration: 10000
        }
    }
}
