import QtQuick

Item {
    id: root

    property int frameIndex: 0

    property var frames: [
        "/tmp/frame1.jpg",
        "/tmp/frame2.jpg",
        "/tmp/frame3.jpg"
    ]

    Timer {
        interval: 83
        running: true
        repeat: true

        onTriggered: {
            frameIndex =
                (frameIndex + 1) % frames.length
        }
    }

    Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        source: root.frames[root.frameIndex]
    }
}
