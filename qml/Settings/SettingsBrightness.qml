import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/General/"

Item{
    id: root

    //Properties
    property int brightness: 100

    onBrightnessChanged: {
        var setVolumenValue= Math.round(brightness/20) + 1
        console.log("set system value to",setVolumenValue)
        Bridge.setBrightness(7-setVolumenValue)
    }

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 48

        Label{
            text: qsTr("BRIGHTNESS")
            color: "white"
            font.pointSize: Qt.application.font.pointSize+10
            font.weight: Font.Bold
        }

        Rectangle{
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 100
            Layout.preferredHeight: 350
            color: "#323232"
            radius: 15

            Rectangle{
                anchors.bottom: parent.bottom
                width: parent.width
                height: Math.max(30, parent.height*brightness/100)
                color: "#D9D9D9"
                radius: 15
            }

            Icon{
                anchors.bottom: parent.bottom
                anchors.bottomMargin: parent.width*0.25
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width*0.85
                height: width
                imageIcon: "9042943_sun_light_icon_acacac.png"
                mipmap: true
            }

            MouseArea{
                anchors.fill: parent

                onMouseYChanged: {
                    brightness= 100-Math.max(1, Math.min(100, Math.floor((mouseY/height)*100)))
                }
            }
        }
    }
}
