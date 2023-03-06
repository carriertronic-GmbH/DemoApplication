import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle{
    id: root
    color: "#323232"

    //Properties
    property alias text: labelContent.text

    Flickable{
        anchors.fill: parent
        anchors.margins: 5
        contentWidth: width
        contentHeight: labelContent.height
        interactive: contentHeight>height

        Label{
            id: labelContent
            width: parent.width
            wrapMode: "WrapAtWordBoundaryOrAnywhere"
            leftPadding: 5
            rightPadding: 5
            color: "white"
            font.weight: Font.DemiBold
        }

        ScrollIndicator.vertical: ScrollIndicator{}
    }
}
