import QtQuick 2.0


Rectangle {
    anchors.centerIn: parent
    Grid {
          id: grid
          anchors.centerIn: parent
          columns: 2
          columnSpacing: 32
          rowSpacing: 16



        Navbutton{
            color:"#428bca"
            text : "Hallo beantworten"
            page : "qrc:/videoquestion.qml"
            param : "hallo"
        }

        Navbutton{
            color:"#428bca"
            text : "Hallo sagen"
            page : "qrc:/videoquestion_init.qml"
            param : "hallo"
        }

        Navbutton{
            color:"#82ba26"
            param: "bye"
            text : "Tschuss beantworten"
            page : "qrc:/videoquestion.qml"
        }

        Navbutton{
            color:"#82ba26"
            param: "bye"
            text : "Tschuss sagen"
            page : "qrc:/videoquestion_init.qml"
        }

        Navbutton{
            color:"#05509d"
            text : "Morgen beantworten"
            page : "qrc:/videoquestion.qml"
            param : "morgen"
        }
        Navbutton{
            color:"#05509d"
            text : "Morgen sagen"
            page : "qrc:/videoquestion_init.qml"
            param : "morgen"
        }

        /*Navbutton{
            color:"#82ba26"
            text : "Haus"
            page : "qrc:/videoquestion.qml"
            param : "haus"
        }


        Navbutton{
            text : "Aufnahme"
            color:"#82ba26"
            page : "qrc:/camera.qml"
        }

        Navbutton{
            //anchors.top: aufgabe1.bottom
            text : "Score"
            color:"#428bca"
            page : "qrc:/score.qml"
        }

        Navbutton{
            //anchors.top: aufgabe1.bottom
            text : "Settings"
            color:"#428bca"
            page : "qrc:/settings.qml"
        }

        Navbutton{
            id:aufgabe1
            text : "Spiel"
            color:"#05509d"
            param: "qrc:/assets/aufgabe1.xml"
            page : "qrc:/slotimage.qml"
        }*/

    }
}
