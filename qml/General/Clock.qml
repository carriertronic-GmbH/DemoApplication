import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

RowLayout{
    id: root

    //Properties
    property var currentDateTime: new Date()

    Icon{
        Layout.preferredWidth: 30
        Layout.preferredHeight: 30
        materialIcon: "mdi-clock-outline"
        materialIconColor: "white"
    }

    RowLayout{
        Label{
            text: ("00" + currentDateTime.getHours()).substr(-2,2)
            font.pointSize: Qt.application.font.pointSize+6
            font.weight: Font.Bold
        }
        Label{
            text: ":"
            opacity: currentDateTime.getSeconds()%2
            font.pointSize: Qt.application.font.pointSize+6
            font.weight: Font.Bold
        }
        Label{
            text: ("00" + currentDateTime.getMinutes()).substr(-2,2)
            font.pointSize: Qt.application.font.pointSize+6
            font.weight: Font.Bold
        }
    }

    Timer{
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            currentDateTime= new Date()
        }
    }
}
