import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ToolButton{
    id: root

    width: 48
    height: 48

    //Properties
    property string materialIcon: ""
    property string imageIcon: ""
    property alias iconRealScale: icon_.realScale
    property alias materialIconColor: icon_.materialIconColor
    property alias backgroundColor: backgroundRect.color
    property bool toolTipEnabled: false
    property alias toolTipText: toolTip.text
    property alias title: textLabel.text

    Rectangle{
        id: backgroundRect
        anchors.fill: parent
        border.color: root.highlighted ? "#2B3F46" : "transparent"
        color: "transparent"
        radius: height/4
        scale: icon_.realScale+0.2
    }

    RowLayout{
        anchors.fill: parent
        Icon{
            id: icon_
            Layout.fillHeight: true
            Layout.preferredWidth: height
            materialIcon: root.materialIcon
            imageIcon: root.imageIcon
            realScale: 0.4
        }

        Label{
            id: textLabel
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: ""
            visible: text
            verticalAlignment: "AlignVCenter"
            horizontalAlignment: "AlignHCenter"
            topPadding: 5
        }
    }

    onClicked: {
        clickAnimation.start()
    }

    //Animations
    SequentialAnimation{
        id: clickAnimation
        NumberAnimation{
            target: icon_
            property: "scale"
            from: 1
            to: 0.9
            duration: 100
        }
        NumberAnimation{
            target: icon_
            property: "scale"
            from: 0.9
            to: 1
            duration: 100
        }
    }

    ToolTip{
        id:toolTip
        visible: hovered && toolTipEnabled && text
        text: ""
        delay: 600
    }
}
