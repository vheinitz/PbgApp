import QtQuick 2.0
import "camera"

import QtQuick 2.0
import QtMultimedia 5.4

Rectangle {
    id : cameraUI

    color:"#82ba26"
    state: "VideoCapture"
    width:mainarea.width
    height:mainarea.height

    Camera {
        id: camera
        captureMode: Camera.CaptureVideo

        videoRecorder {
             resolution: "640x480"
             frameRate: 30
             outputLocation : "file:///storage/emulated/0/pbgapp/"
        }
    }


    VideoOutput {
      id: videoOutput
      source: camera
      anchors.centerIn: parent
      width:cameraUI.width
      height:cameraUI.height
      //anchors.fill: parent
      autoOrientation: true
      property bool recording:false

      MouseArea
      {
          anchors.fill: parent
          onClicked: {
              if (videoOutput.recording)
              {
                  onClicked: camera.videoRecorder.stop()
                  videoOutput.recording=false
              }
              else
              {
                  onClicked: camera.videoRecorder.record()
                  videoOutput.recording=true
              }
          }
      }
    }

    Rectangle
    {
        id:isRecording
        width:50
        height:50
        x:100
        y:100
        visible: videoOutput.recording
        color:"red"

    }

/*
    Component.onCompleted:
    {
        x = 0
        y=0
        width=parent.width
        height=parent.height
    }
    states: [
        State {
            name: "VideoCapture"
            StateChangeScript {
                script: {
                    camera.captureMode = Camera.CaptureVideo
                    camera.start()
                }
            }
        },
        State {
            name: "VideoPreview"
            StateChangeScript {
                script: {
                    camera.stop()
                }
            }
        }
    ]

    Camera {
        id: camera
        captureMode: Camera.CaptureVideo

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview
                stillControls.previewAvailable = true
                cameraUI.state = "VideoPreview"
            }
        }

        videoRecorder {
             resolution: "640x480"
             frameRate: 30
             outputLocation : "file:///storage/emulated/0/pbgapp/"
        }
    }

    VideoOutput {
      id: videoOutput
      source: camera
      anchors.fill: parent
      orientation: 180

      MouseArea
      {
          anchors.fill: parent
          onClicked: {
              selectNext()
          }
      }
    }


    */
}
