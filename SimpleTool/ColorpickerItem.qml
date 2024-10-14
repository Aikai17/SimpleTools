import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

Rectangle{
    color:Colors.currentTheme.background
    id:root
    visible:false
    MouseArea {
            anchors.fill: parent
            onClicked: forceActiveFocus()
    }
    ColumnLayout{
        anchors.fill:parent
        Text{
            color:Colors.currentTheme.textColor
            Layout.alignment:Qt.AlignHCenter
            text:"<h1>COLOR PICKER</h1>"
        }
        Rectangle{
            id:colorpreview
            radius: 30
            border.color:"black"
            Layout.alignment:Qt.AlignHCenter
            Layout.maximumWidth:Screen.desktopAvailableWidth/2
            Layout.minimumHeight:Screen.desktopAvailableHeight/4
            Layout.minimumWidth:Screen.desktopAvailableWidth/6
            Layout.preferredWidth:parent.width
            Layout.preferredHeight:parent.height/2
            color.r:rcolor.value
            color.g:gcolor.value
            color.b:bcolor.value
            onColorChanged: {
                outputcolor.text=color
            }
            Layout.bottomMargin:20
        }
        TextField{
            id:outputcolor
            color: Colors.currentTheme.textColor
            readOnly:true
            Layout.alignment:Qt.AlignHCenter
            Layout.preferredWidth:colorpreview.width
            Layout.preferredHeight:colorpreview.height/8
            text:colorpreview.color
            font.pixelSize:24
            horizontalAlignment:Text.AlignHCenter
            background: Rectangle{
                border.color:Colors.currentTheme.borderColor
                color: Colors.currentTheme.backgroundControls
                width:parent.width
                height:parent.height
                radius:30
            }
        }
        Item{
            Layout.preferredWidth:colorpreview.width
            Layout.preferredHeight:100
            Layout.minimumHeight:10
            Layout.alignment:Qt.AlignHCenter
            Row{
                anchors.fill:parent
                spacing:45
                SliderRGB{
                    id:rcolor
                    width:parent.width/3-30
                    height:50
                    text: "R"
                }
                SliderRGB{
                    id:gcolor
                    width:parent.width/3-30
                    height:50
                    text: "G"
                }
                SliderRGB{
                    id:bcolor
                    width:parent.width/3-30
                    height:50
                    text: "B"
                }
                Layout.bottomMargin:20
            }
        }


        Item{ Layout.fillHeight:true}
    }

}


