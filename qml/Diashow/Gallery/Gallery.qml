import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.folderlistmodel 2.15
import "qrc:/qml/Dashboard/"

Page {
    id: root
    title: qsTr("Gallery")

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

    FolderListModel {
        id: folderModel
        nameFilters: ["*.jpg", "*.png"]
        caseSensitive: false
        showDirs: false
        folder : "qrc:/resources/Images/diashow"
    }

    Label{
        anchors.centerIn: parent
        text: "No image is available"
        font.pointSize: Qt.application.font.pointSize+3
        font.weight: Font.DemiBold
        visible: !folderModel.count
    }

    GridView{
        id: gridview
        anchors.fill: parent
        clip: true
        model: folderModel
        cellWidth: root.width/4
        cellHeight: cellWidth
        delegate: Item{
            id: rootDelegate
            width: gridview.cellWidth
            height: gridview.cellHeight

            //Properties
            property bool fullscreen: false

            Image{
                id: imageDelegate
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectCrop
                source: fileUrl

                Button{
                    id: buttonDelegate
                    anchors.fill: parent
                    flat: true
                    topInset: 0
                    bottomInset: 0
                    onClicked: {
                        if(rootDelegate.fullscreen){
                            imageDelegate.parent= rootDelegate
                            rootDelegate.fullscreen= false
                        }else{
                            zoomAnimation.start()
                        }
                    }
                }
            }

            //Animations
            SequentialAnimation{
                id: zoomAnimation
                ScriptAction{
                    script: fullscreenImage.visible= true
                }
                NumberAnimation{
                    target: imageDelegate
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 350
                }
                ScriptAction{
                    script:  {
                        fullscreenImage.source= fileUrl
                        fullscreenImage.zoomOutAnimation= zoomOutAnimation
                    }
                }
                NumberAnimation{
                    target: fullscreenImage
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 350
                }
            }

            SequentialAnimation{
                id: zoomOutAnimation
                NumberAnimation{
                    target: fullscreenImage
                    property: "opacity"
                    to: 0
                    duration: 350
                }
                NumberAnimation{
                    target: imageDelegate
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 350
                }
                ScriptAction{
                    script: fullscreenImage.visible= false
                }
            }
        }
    }

    Image {
        id: fullscreenImage
        visible: false
        opacity: 0
        anchors.fill: parent
        parent: Overlay.overlay
        fillMode: Image.PreserveAspectCrop

        //Properties
        property var zoomOutAnimation

        MouseArea{
            anchors.fill: parent
            onClicked: {
                fullscreenImage.zoomOutAnimation.start()
            }
        }
    }
}
