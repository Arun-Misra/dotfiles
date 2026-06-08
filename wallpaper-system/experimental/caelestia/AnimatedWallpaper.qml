import QtQuick
import Quickshell
import Quickshell.Wayland

ShellRoot {
    PanelWindow {
        id: root

        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        property int frameIndex: 0

        property var frames: [
            "/home/arun/Pictures/Wallpapers/c1.jpg",
            "/home/arun/Pictures/Wallpapers/c2.jpg",
            "/home/arun/Pictures/Wallpapers/c3.jpg"
        ]

        Timer {
            interval: 1000
            running: true
            repeat: true

            onTriggered: {
                root.frameIndex =
                    (root.frameIndex + 1) %
                    root.frames.length
            }
        }

        Image {
            anchors.fill: parent

            fillMode: Image.PreserveAspectCrop

            source: root.frames[root.frameIndex]
        }
    }
}
