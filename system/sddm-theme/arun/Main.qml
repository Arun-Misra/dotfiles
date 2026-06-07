import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import SddmComponents 2.0

Rectangle {
id: root 
width: 1920
height: 1080
color: "black"
property color accent: "#8a5cff"
property color textPrimary: "#ffffff"
property color textSecondary: "#d0d0d0"
Image {
    id: wallpaper
    anchors.fill: parent
    source: "background.jpg"
    fillMode: Image.PreserveAspectCrop
    smooth: true
    asynchronous: true

}
Rectangle {
    anchors.fill: parent
    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#08000000"
        }
        GradientStop {
            position: 0.45
            color: "#22000000"
        }
        GradientStop {
            position: 1.0
            color: "#99000000"
        }
    }
}
Rectangle {
    anchors.bottom: parent.bottom
    width: parent.width
    height: 420
    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#00000000"
        }
        GradientStop {
            position: 1.0
            color: "#dd000000"
        }
    }
}
Item {
    id: clockContainer
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    anchors.topMargin: 70
    width: 500
    height: 100
    opacity: 1.0
    Text {
        id: clockText
        anchors.horizontalCenter: 
        parent.horizontalCenter;

        text: Qt.formatDateTime(new Date(), "hh:mm")

        color: root.textPrimary
        font.pixelSize: 96
        font.weight: Font.Bold

        style: Text.Outline
       styleColor: "#22000000"
    }
    Rectangle {
        width: clockText.width + 40
        height: clockText.height + 10
        anchors.centerIn: clockText
        radius: 30
        color: "#01000000"
        border.width: 0
        opacity: 0.15
        z: -1
    }
    Text {
        anchors.top: clockText.bottom
        anchors.topMargin: -10
        anchors.horizontalCenter: 
        parent.horizontalCenter
        text: Qt.formatDateTime(
            new Date(),
            "dddd, MMMM d"
        )
        color: root.textSecondary
        font.pixelSize: 22
        font.weight: Font.Medium
    }
}
Item {
   id: loginContainer
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    anchors.verticalCenterOffset: 90
    width: 520
    height: 260
    Column {
        anchors.centerIn: parent
        spacing: 26
        Text {
            anchors.horizontalCenter: 
            parent.horizontalCenter
	    text: "ARUN"
	    color: root.textPrimary
            font.pixelSize: 40
            font.letterSpacing: 6
            font.weight: Font.DemiBold
        }
        Rectangle {
            id: passwordShell
            width: 380
            height: 62
            radius: 20
            color: "#55000000"
            border.width: 0
            border.color: "#22ffffff"
            layer.enabled: true
            Rectangle {
                anchors.fill: parent
                radius: parent.radius
                color: "#18ffffff"
		opacity: 0.45
            }
            TextField {
		id: passwordField
		focus: true
		Component.onCompleted: forceActiveFocus()
                anchors.fill: parent
                anchors.leftMargin: 22
                anchors.rightMargin: 60
                color: "white"
                echoMode: TextInput.Password
                placeholderText: "Password"
                placeholderTextColor: "#c0ffffff"
                selectByMouse: true
                background: Item {}
                Keys.onReturnPressed: {
                    sddm.login(
                        "arun",
                        passwordField.text,
                        sessionModel.lastIndex
                    )
                }
	}
  	Timer {
    interval: 250
    running: true
    repeat: false
    onTriggered: passwordField.forceActiveFocus()
}
            Text {
                id: loginArrow

                anchors.right: parent.right
                anchors.rightMargin: 12
                anchors.verticalCenter: parent.verticalCenter

                text: "→"

                color: "white"

                font.pixelSize: 36
                font.weight: Font.Bold

                MouseArea {
                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onEntered: loginArrow.color = root.accent
                    onExited: loginArrow.color = "white"

                    onClicked: {
                        sddm.login(
                            "arun",
                            passwordField.text,
                            sessionModel.lastIndex
                        )
                    }
                }
            }
        }
    }
}
Row {
    id: powerRow
    spacing: 36
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.bottomMargin: 30
    anchors.rightMargin: 42
    Repeater {
        model: ["⏻", "↻", "☾"]
        delegate: Text {
            text: modelData
            color: "#dddddd"
            font.pixelSize: 24
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = root.accent
                onExited: parent.color = "#dddddd"
            }
        }
    }
}
}
