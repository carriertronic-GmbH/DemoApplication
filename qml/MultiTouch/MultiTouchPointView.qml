import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    width: 48; height: 48
    radius: height/2
    color: "white"

    onXChanged: {
        var component = Qt.createComponent("qrc:/qml/MultiTouch/MultiTouchComponent.qml");
        var object = component.createObject(rootItemOverlay);
        object.x = x+12;
        object.y = y+12;
        object.color = color
    }
    onYChanged: {
        var component = Qt.createComponent("qrc:/qml/MultiTouch/MultiTouchComponent.qml");
        var object = component.createObject(rootItemOverlay);
        object.x = x+12;
        object.y = y+12;
        object.color = color
    }
}
