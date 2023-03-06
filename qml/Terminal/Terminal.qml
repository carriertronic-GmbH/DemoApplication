import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/General/"

Page {
    id: root
    title: qsTr("TERMINAL")

    //Properties
    property string lastPageTitle: ""

    Connections{
        target: Bridge

        onSgnSerialDataComming: {
            if(responseData)
                datamodel.append({
                                     command: responseData,
                                     cmdType: "response"
                                 })
        }
    }

    Component.onCompleted: {
        lastPageTitle= window.pageTitle
        window.pageTitle= root.title
    }

    Component.onDestruction: {
        window.pageTitle= lastPageTitle
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 24

        RowLayout{
            ListView{
                id: listview
                Layout.fillWidth: true
                Layout.fillHeight: true
                model: datamodel
                delegate: Label{
                    width: parent ? parent.width : 0
                    text: (cmdType==="userInput" ? "<strong>$</strong>" : "") + "<font color='white'>"  + command + "</font>"
                    wrapMode: "WrapAnywhere"
                    font.pointSize: Qt.application.font.pointSize+3
                }

                ScrollBar.vertical: ScrollBar{}
            }

            Flickable{
                Layout.preferredWidth: 200
                Layout.fillHeight: true
                contentWidth: width
                contentHeight: shortcutColumn.height
                clip: true
                interactive: contentHeight

                ColumnLayout{
                    id: shortcutColumn

                    Button{
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 100
                        text: "Hello world"

                        onClicked: {
                            sendCommand("Hello world", "userInput")
                        }
                    }

                    Button{
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 100
                        text: "Other Commands"

                        onClicked: {
                            sendCommand("Other Commands", "userInput")
                        }
                    }
                }
                ScrollIndicator.vertical: ScrollIndicator{}
            }
        }

        TextField{
            id: textfield
            Layout.fillWidth: true
            Layout.preferredHeight: 64
            placeholderText: qsTr("Enter Command")
            rightPadding: 48
            leftPadding: 48 + rsCombobox.width

            onAccepted: sendCommand(textfield.text, "userInput")

            ComboBox{
                id: rsCombobox
                anchors.left: parent.left
                model: ["RS232","RS485"]

                onCurrentIndexChanged: {
                    openPort( rsCombobox.model[rsCombobox.currentIndex] )
                }
            }

            Icon{
                anchors.left: parent.left
                anchors.leftMargin: rsCombobox.width
                materialIcon: "mdi-console-line"
                realScale: 0.65
            }

            IconButton{
                anchors.right: parent.right
                materialIcon: "mdi-chevron-right"
                topInset: 0
                bottomInset: 0
                iconRealScale: 0.65

                onClicked: {
                    sendCommand(textfield.text, "userInput")
                }
            }
        }
    }

    //Data Model
    ListModel{
        id: datamodel
        //        ListElement{
        //            command: "cd /"
        //            cmdType: "userInput" //or response
        //        }
    }

    //Functions
    function openPort(port){
        Bridge.closeSerialCommand()
        if(port==="RS232"){
            Bridge.openSerialCommand("/dev/verdin-uart1‏")
        }else if(port==="RS485"){
            Bridge.openSerialCommand("/dev/verdin-uart2‏")
        }
    }

    function sendCommand(cmd, cmdType){
        if(!cmd)
            return
        datamodel.append({
                             command: cmd,
                             cmdType: cmdType
                         })
        Bridge.sendSerialCommand(textfield.text)
        textfield.clear()
        if(listview.contentHeight>listview.height)
            listview.positionViewAtEnd()
    }
}
