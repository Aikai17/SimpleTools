import QtQuick
import QtQuick.Controls
Item{
    readonly property alias value: colorslider.value
    property alias text:rgbid.text
    required text
    Row{
        id:row
        anchors.fill:parent
        Column{
            Label{
                id:rgbid
                anchors.left:colorslider.horizontalCenter
                color:Colors.currentTheme.textColor
            }
            Slider{
                id: colorslider
                width:row.width
                height:row.height
                from:0
                to:1
                onValueChanged:{
                    rgbidfield.text=value*255//binding loop doesnt appear
                }
                background: Rectangle {
                    x: colorslider.leftPadding
                    y: colorslider.topPadding + colorslider.availableHeight / 2 - height / 2
                    implicitWidth: 200
                    implicitHeight: 4
                    width: colorslider.availableWidth
                    height: colorslider.handle.height
                    border.color:Colors.currentTheme.borderColor
                    radius: 13
                    Rectangle {
                        width: parent.width
                        height: parent.height
                        color: Colors.currentTheme.backgroundControls
                        radius: 13
                    }
                }
                handle: Rectangle {
                    x: colorslider.leftPadding + colorslider.visualPosition * (colorslider.availableWidth - width)
                    y: colorslider.topPadding + colorslider.availableHeight / 2 - height / 2
                    implicitWidth: 26
                    implicitHeight: 26
                    radius:13
                    border.color:Colors.currentTheme.borderColor
                    border.width:5
                    color: Colors.currentTheme.sliderHandler
                    opacity: colorslider.pressed?0.5:1
                }
            }
            Item{
                width:colorslider.width
                height:50
                TextField{
                    color:Colors.currentTheme.textColor
                    anchors.centerIn:parent
                    id:rgbidfield
                    width:parent.width/2
                    text:"0"
                    font.pixelSize:14
                    horizontalAlignment: TextInput.AlignHCenter
                    onTextChanged: {
                        colorslider.value=parseInt(text)/255//binding loop doesnt appear
                    }
                    background: Rectangle{
                        border.color:Colors.currentTheme.borderColor
                        color: Colors.currentTheme.backgroundControls
                        width:parent.width
                        height:parent.height
                        radius:30
                    }
                }
            }


        }
    }

}
