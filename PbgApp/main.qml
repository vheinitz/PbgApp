import QtQuick 2.9
import QtQuick.Window 2.2
import QtQml.Models 2.2

Window {

    width:600
    height:800
    visible: true
    Rectangle
    {
        id:headline
        x:0
        height: 50
        width: parent.width
        color: "#5d98d1"

        Navbutton{
            id:exit
            color: "#5d98d1"
            page : "exit"
            width: 40
            height: 40
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width - width -10
            Image {
                source: "qrc:/assets/cancel.png"
                anchors.centerIn: parent
                width: 40
                height: 40
            }
        }
        Text
        {
            id:statusText
            anchors.horizontalCenter: parent.horizontalCenter
            text: ""
        }
        Navbutton{
            id:menubutton
            color: "#5d98d1"
            page : "qrc:/menu.qml"
            width: 40
            height: 40
            anchors.verticalCenter: parent.verticalCenter
            x: 20
            Image {
                source: "qrc:/assets/icons8-menü-filled-50.png"
                anchors.centerIn: parent
                width: 40
                height: 40
            }
        }
    }
    Rectangle
    {
        anchors.top: headline.bottom
        width:parent.width
        height: parent.height - headline.height
        id:mainarea
        Loader
        {
            anchors.centerIn: mainarea
            id:pageLoader
            property string param1: ""
            source: "qrc:/menu.qml"
        }
    }


    Item {
        id:keyhandler
        signal checkRight
        anchors.fill: parent
        focus: true
        Keys.onPressed:
        {
            checkRight()
            console.log("next")
        }
    }

}
