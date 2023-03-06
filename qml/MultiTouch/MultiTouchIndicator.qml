import QtQuick 2.15
import QtQuick.Controls 2.15

Image {
    id: root
    x: parent.width/2-width/2+100
    y: parent.height/2-height/2
    rotation: 90
    width: root.width*0.25
    height: root.height*0.4
    source: "qrc:/resources/Icons/446294_down_finger_gesture_hand_interactive_icon.png"
    fillMode: Image.PreserveAspectFit

    SequentialAnimation{
        running: root.visible
        loops: SequentialAnimation.Infinite
        NumberAnimation{
            target: root
            property: "x"
            from: parent.width/2-root.width/2+48
            to: parent.width/2-root.width/2-48
            duration: 3000
            easing.type: "OutQuint"
        }
        NumberAnimation{
            target: root
            property: "x"
            from: parent.width/2-root.width/2-48
            to: parent.width/2-root.width/2+48
            duration: 3000
            easing.type: "OutQuint"
        }
    }
}
