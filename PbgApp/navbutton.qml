import QtQuick 2.0

Rectangle{
    id: aufgabe1
    property string page;
    property string text;
    property string param;
    width: 400
    height: 100
    color: "red"

    Text {
        id:captionText
        text:parent.text
        anchors.verticalCenter: parent.verticalCenter
        font.family: "sans-serif";
        font.pointSize: 20;
        color: "white"
        x:10
    }

    Text {
        width: 20
        x:parent.width - 25
        anchors.verticalCenter: parent.verticalCenter
        text:captionText.text ? ">" : ""
        font.family: "sans-serif";
        font.pointSize: 13;
        color: "white"
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            if (page == "exit")
            {
                Qt.quit()
            }
            else
            {
                pageLoader.param1 = param
                pageLoader.source = page
            }
        }
    }
}

