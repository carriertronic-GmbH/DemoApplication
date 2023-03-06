import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: root
    title: qsTr("SETTINGS")

    //Properties
    property string lastPageTitle: ""

    Component.onCompleted: {
        lastPageTitle= window.pageTitle
        window.pageTitle= root.title
    }

    Component.onDestruction: {
        window.pageTitle= lastPageTitle
    }

    RowLayout{
        anchors.fill: parent
        spacing: 0

        SettingsBrightness{
            Layout.preferredWidth: root.width/3
            Layout.fillHeight: true
        }

        SettingsNetwork{
            Layout.preferredWidth: root.width/3
            Layout.fillHeight: true
        }

        SettingsFlash{
            Layout.preferredWidth: root.width/3
            Layout.fillHeight: true
        }
    }
}
