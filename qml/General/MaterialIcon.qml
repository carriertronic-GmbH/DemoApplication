import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/resources/JSFiles/Icon.js" as MaterialIconJs

Label {
    property string materialIcon: ""
    text: materialIcon ? MaterialIconJs.icons[materialIcon] : ""
    minimumPointSize: 1
    font.pointSize: 360
    fontSizeMode: Text.Fit
    color: "grey"
    font.family: "Material Design Icons"
    horizontalAlignment: "AlignHCenter"
    verticalAlignment: "AlignVCenter"
    opacity: enabled ? 1 : 0.25

    //Properties
    property alias colorAnimation: colorBehavior.enabled

    Behavior on color {
        id: colorBehavior
        ColorAnimation{
            duration: 200
        }
    }

    Behavior on scale {
        NumberAnimation{
            duration: 200
        }
    }
}

//NOTE How to use
//MaterialIcon {
//    materialIcon: "mdiInformation"
//    height: 48
//    width: 48
//    anchors.centerIn: parent
//    scale: 1
//}
