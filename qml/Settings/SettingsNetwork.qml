import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/General/"

Item{
    id: root

    Component.onCompleted: {
        readAllInterfaces()
    }

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 48

        Label{
            id: label
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("NETWORK")
            color: "white"
            font.pointSize: Qt.application.font.pointSize+10
            font.weight: Font.Bold
        }

        ListView{
            id: listview
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 320
            Layout.preferredHeight: 350
            clip: true
            spacing: 5
            model: dataModel
            delegate: RowLayout{
                width: listview ? listview.width : 0
                Label{
                    Layout.preferredWidth: 125
                    text: `${ifName}:`
                    color: "white"
                    font.pointSize: Qt.application.font.pointSize+3
                    elide: "ElideRight"
                }

                ListView{
                    Layout.fillWidth: true
                    Layout.preferredHeight: contentHeight
                    model: JSON.parse(ifIpAddress)
                    interactive: false
                    delegate: Label{
                        width: parent ? parent.width : 0
                        font.weight: Font.DemiBold
                        text: modelData
                        font.pointSize: Qt.application.font.pointSize+3
                        horizontalAlignment: "AlignRight"
                    }
                }
            }
        }
    }

    //Datamodel
    ListModel{
        id: dataModel
        //Example data
//        ListElement{
//            ifName: "eth0"
//            ifIpAddress: "192.168.1.123"
//        }
//        ListElement{
//            ifName: "eth1"
//            ifIpAddress: "192.168.0.101"
//        }
//        ListElement{
//            ifName: "wlan0"
//            ifIpAddress: "-"
//        }
    }

    //Functions
    function readAllInterfaces(){
        var interfaceList= Bridge.read_all_interfaces()
        interfaceList.forEach((data)=>{
                                  dataModel.append({
                                                       ifName: data.name,
                                                       ifIpAddress: JSON.stringify(data.ips)
                                                   })
                              })
    }
}
