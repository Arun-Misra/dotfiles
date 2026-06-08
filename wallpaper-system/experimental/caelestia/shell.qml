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

	property var frames: {
        let result = [];
        for (let i = 1; i <= 120; i++) {
          result.push(
            "file:///tmp/png-test/"
            + String(i).padStart(4, "0")
            + ".png"
        );
    }
    return result;
}
        Timer {
            interval: 83
            running: true
            repeat: true

            onTriggered: {
                root.frameIndex =
                    (root.frameIndex + 1) %
                    root.frames.length
            }
        }

        Repeater {
            model: root.frames.length

            Image {
                anchors.fill: parent

                fillMode: Image.PreserveAspectCrop
		
		cache: true
		asynchronous: true
                source: root.frames[index]

                visible: index === root.frameIndex
            }
        }
	Timer {
    interval: 10000
    running: true
    repeat: false

    onTriggered: Qt.quit()
}
}
}
