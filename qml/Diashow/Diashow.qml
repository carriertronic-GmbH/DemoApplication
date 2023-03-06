import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/Dashboard/"

Page {
    id: root
    title: qsTr("DIASHOW")

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

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 48

        RowLayout{
            DashboardButton{
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("Slideshow")
                imageIcon: "9042787_media_image_list_icon dbb84c.png"

                onClicked: {
                    root.StackView.view.push("qrc:/qml/Diashow/SlideShow/SlideShow.qml")
                }
            }
            DashboardButton{
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: qsTr("Gallery")
                imageIcon: "9042787_media_image_list_icon dbb84c.png"

                onClicked: {
                    root.StackView.view.push("qrc:/qml/Diashow/Gallery/Gallery.qml")
                }
            }
        }
    }
}
