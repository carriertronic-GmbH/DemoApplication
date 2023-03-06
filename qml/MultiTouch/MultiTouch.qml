import QtQuick 2.15
import QtQuick.Controls 2.15

Page{
    id: root
    title: qsTr("MULTITOUCH")

    //Properties
    property string lastPageTitle: ""

    Component.onCompleted: {
        lastPageTitle= window.pageTitle
        window.pageTitle= root.title
    }

    Component.onDestruction: {
        window.pageTitle= lastPageTitle
    }

    Item{
        id: rootItemOverlay
        anchors.fill: parent
        parent: Overlay.overlay

        MultiPointTouchArea {
            id: multiTouchPointArea
            anchors.fill: parent
            mouseEnabled: true
            touchPoints: [
                TouchPoint { id: point1 },
                TouchPoint { id: point2 },
                TouchPoint { id: point3 },
                TouchPoint { id: point4 },
                TouchPoint { id: point5 }
            ]

            onPressed: {
                handImage.visible= false
                touchPoints.forEach((touchPoint)=>{
                                        if(touchPoint.x<64 && touchPoint.y<64){
                                            root.StackView.view.pop()
                                        }
                                    })
            }
        }

        MultiTouchPointView{
            visible: (point1.x)!==0 &&  (point1.y)!==0
            x: point1.x-width/2
            y: point1.y-height/2
            color: "green"
        }

        MultiTouchPointView{
            visible: (point2.x)!==0 &&  (point2.y)!==0
            x: point2.x-width/2
            y: point2.y-height/2
            color: "yellow"
        }

        MultiTouchPointView{
            visible: (point3.x)!==0 &&  (point3.y)!==0
            x: point3.x-width/2
            y: point3.y-height/2
            color: "red"
        }

        MultiTouchPointView{
            visible: (point4.x)!==0 &&  (point4.y)!==0
            x: point4.x-width/2
            y: point4.y-height/2
            color: "blue"
        }

        MultiTouchPointView{
            visible: (point5.x)!==0 &&  (point5.y)!==0
            x: point5.x-width/2
            y: point5.y-height/2
            color: "pink"
        }
    }

    MultiTouchIndicator{
        id: handImage
    }
}
