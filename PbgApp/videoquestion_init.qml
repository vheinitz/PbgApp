import QtQuick 2.1
import QtMultimedia 5.4
import QtQml.Models 2.2
import QtQuick.XmlListModel 2.0
import Qt.labs.folderlistmodel 2.1

Rectangle
{
    id :page
    property string task: pageLoader.param1
    property int idx: 0;
    color:"#82ba26"
    state: "VideoCapture"
    width:mainarea.width
    height:mainarea.height

    MediaPlayer {
        id: player
        autoPlay: true
    }


    VideoOutput {
      id: videoOutput
      source: player
      anchors.fill: parent
      orientation: 180

      MouseArea
      {
          anchors.fill: parent
          onClicked: {
              play()
          }
      }
    }

    function replay() {
        var s = player.source;
        //player.source=""
        //player.source= s;
        player.play()
    }

    function play() {
        player.source=""
        player.source= "file:///"+appdata.nextItem();
        player.seek(1);
        player.pause()
        //pauseTimer.reastart()
        //statusText.text = player.source
    }



    Component.onCompleted:
    {
        width: parent.width
        height: parent.height
        appdata.loadTask(task)
        play();
        keyhandler.checkRight.connect( replay )
    }
}
