pragma Singleton
import QtQuick

Item {
    QtObject {
        id: light
        readonly property color background: "#FCF8EC"
        readonly property color backgroundControls:"#D0E8F2"
        readonly property color sliderHandler:"#456268"
        readonly property color textColor: "#456268"
        readonly property color borderColor: "#79A3B1"
    }
    QtObject {
        id: dark
        readonly property color background: "#222831"
        readonly property color backgroundControls:"#393E46"
        readonly property color sliderHandler:"#EEEEEE"
        readonly property color textColor: "#EEEEEE"
        readonly property color borderColor: "#292d33"
    }
    property var currentTheme: dark
    property alias dark: dark
    property alias light: light
}
