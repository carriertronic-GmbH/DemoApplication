import QtQuick 2.15

Item {
    id: root

    width: 48
    height: 48

    //Properties
    readonly property string baseUrlForImageIcons: "qrc:/resources/Icons/"
    property string imageIcon: ""
    property string materialIcon: ""
    property string materialIconColor: "grey"
    property real realScale: 1
    property alias materialIconColorAnimation: icon_.colorAnimation
    property alias mipmap: imageIconId.mipmap

    //Material icon
    MaterialIcon{
        id: icon_
        anchors.centerIn: parent
        width: parent.width*realScale
        height: parent.height*realScale
        materialIcon: root.materialIcon
        color: materialIconColor
    }

    //Image icon
    Image{
        id: imageIconId
        anchors.centerIn: parent
        width: parent.width*realScale*0.85
        height: parent.height*realScale*0.85
        sourceSize.width: width
        sourceSize.height: height
        source: imageIcon ? baseUrlForImageIcons + imageIcon : ""
        fillMode: Image.PreserveAspectFit
        mipmap: false
    }
}
