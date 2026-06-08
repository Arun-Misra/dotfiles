import QtQuick
import Quickshell
import Quickshell.Wayland

ShellRoot {
    PanelWindow {
        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        color: "black"

        Text {
            anchors.centerIn: parent
            text: "Animated Wallpaper Test"
            color: "white"
        }
    }
}
