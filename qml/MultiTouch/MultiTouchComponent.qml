import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    width: 24; height: 24
    radius: height/2
    color: "white"

    SequentialAnimation{
        running: true
        NumberAnimation{
            duration: 2500
            target: root
            property: "opacity"
            easing.type: "OutQuint"
            from: 1
            to: 0
        }
        ScriptAction{
            script: root.destroy()
        }
    }
}
