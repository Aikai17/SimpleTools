import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Simple
Rectangle{
    id:root
    color:Colors.currentTheme.background
    visible:false
    MouseArea {
            anchors.fill: parent
            onClicked: forceActiveFocus()
    }
    ColumnLayout{
        id:layout
        anchors.fill:parent
        Text{
            Layout.alignment:Qt.AlignHCenter
            color:Colors.currentTheme.textColor
            text:"<h1>URL ENCODER</h1>"
        }
        TextField{
            id:urlinput
            Layout.alignment:Qt.AlignHCenter
            Layout.maximumWidth:Screen.desktopAvailableWidth/2
            Layout.minimumWidth:Screen.desktopAvailableWidth/4
            Layout.minimumHeight:Screen.desktopAvailableHeight/4
            Layout.preferredWidth:root.width
            Layout.preferredHeight:root.height/2
            verticalAlignment: TextInput.AlignTop
            color:Colors.currentTheme.textColor
            text:urlinput.text
            font.pixelSize:24
            wrapMode: Text.Wrap
            Layout.bottomMargin:20
            leftPadding:15
            background: Rectangle{
                border.color:Colors.currentTheme.borderColor
                color: Colors.currentTheme.backgroundControls
                anchors.fill:urlinput
                radius:30
            }
        }

        Item{
            Layout.alignment:Qt.AlignHCenter
            Layout.preferredWidth:urlinput.width
            RoundButton{
                id: encodeButton
                radius:30
                width:urlinput.width/3
                height:urlinput.height/5
                x:urlinput.width/2-width-10
                contentItem:Text{
                    fontSizeMode: Text.Fit
                    font.pixelSize:24
                    text:"<u>E</u>ncode"
                    color:Colors.currentTheme.textColor
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                            radius: encodeButton.radius
                            color: Colors.currentTheme.backgroundControls
                            opacity: encodeButton.pressed?0.5:1
                            border.color:Colors.currentTheme.borderColor
                }
                action:Action{
                    shortcut:"Ctrl+E"
                    onTriggered:{
                        urlinput.text=urlencoder.encode(urlinput.text);
                        forceActiveFocus();
                    }
                }
            }
            RoundButton{
                id: decodeButton
                radius:30
                width:urlinput.width/3
                height:urlinput.height/5
                x:urlinput.width/2+10
                contentItem:Text{
                    fontSizeMode: Text.Fit
                    font.pixelSize:24
                    text:"<u>D</u>ecode"
                    color:Colors.currentTheme.textColor
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                            radius: decodeButton.radius
                            color: Colors.currentTheme.backgroundControls
                            opacity: decodeButton.pressed?0.5:1
                            border.color:Colors.currentTheme.borderColor
                }
                action:Action{
                    shortcut:"Ctrl+D"
                    onTriggered:{
                        urlinput.text=urlencoder.decode(urlinput.text);
                        forceActiveFocus();
                    }
                }

            }
        }
        Urlencoder{
            id:urlencoder
        }
        Item { Layout.fillHeight: true }
    }
}
