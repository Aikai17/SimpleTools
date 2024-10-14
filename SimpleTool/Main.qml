import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCore

ApplicationWindow{
    id:root
    width:640
    height:800
    visible:true

    Component.onCompleted:{
        settings.theme==="dark" ? Colors.currentTheme=Colors.dark : Colors.currentTheme=Colors.light
    }
    //-----------------------header-----------------------------
    menuBar: MenuBar {
        delegate: MenuBarItem {
            id: menuBarItem
            contentItem: Text {
                text:{
                    var temp=menuBarItem.text.substring(1)
                    var txt="<u>"+temp.slice(0,1)+"</u>"+temp.slice(1)
                    return txt//had to write this because first letter of 'text:menuBarItem.text' is not underlined
                }
                opacity: menuBarItem.highlighted?0.5:1
                color:Colors.currentTheme.textColor
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                color: menuBarItem.highlighted ? Colors.currentTheme.backgroundControls : "transparent"
            }
        }
        Menu {
            title: "&File"
            Action {
                shortcut:"Ctrl+Q"
                text: "&Quit"
                onTriggered: {
                    Qt.quit()
                }
            }
        }
        Menu{
            title:"&Theme"
            Action{
                text:"&Dark"
                onTriggered: {
                    Colors.currentTheme=Colors.dark
                    settings.theme="dark"
                }
            }
            Action{
                text:"&Light"
                onTriggered: {
                    Colors.currentTheme=Colors.light
                    settings.theme="light"
                }
            }
        }
        background: Rectangle {
            implicitWidth: 40
            implicitHeight: 40
            color: Colors.currentTheme.background
            Rectangle {
                color: Colors.currentTheme.backgroundControls
                width: parent.width
                height: 1
                anchors.bottom: parent.bottom
            }
        }
    }
    //---------------------------content-----------------------
    StackView{
        id:view
        anchors.fill:parent
        initialItem:colorpicker

        replaceEnter: Transition {
            PropertyAnimation{
                property: "opacity"
                easing.type: Easing.OutQuart
                from:0
                to: 1
                duration: 300

            }
        }
        replaceExit: Transition {
            PropertyAnimation{
                property: "opacity"
                from:1
                to: 0
                duration: 250
            }
        }
    }
    //---------------------------footer------------------------
    footer:Rectangle{
        width:root.width
        height:root.height/10
        color:Colors.currentTheme.background

        ButtonGroup{
            buttons:row.children
        }

        RowLayout{
            id:row
            anchors.fill:parent
            spacing:6
            RoundButton{
                id:converterButton
                radius:30
                Layout.fillHeight:true
                Layout.preferredWidth:parent.width/3
                Layout.minimumWidth:100
                contentItem:Text{
                    fontSizeMode: Text.Fit
                    font.pixelSize:24
                    color:Colors.currentTheme.textColor
                    text:"Converter"
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    radius: converterButton.radius
                    color: Colors.currentTheme.backgroundControls
                    opacity: converterButton.checked?0.5:1
                    border.color:Colors.currentTheme.borderColor
                }
                action: Action{
                    shortcut:"Z"
                    onTriggered: {
                        checked=true
                        if(view.currentItem!==converter){
                            view.replace(converter);
                        }
                    }
                }
            }
            RoundButton{
                id:colorpickerButton
                checked:true
                radius:30
                Layout.fillHeight:true
                Layout.preferredWidth:parent.width/3
                Layout.minimumWidth:100
                contentItem:Text{
                    fontSizeMode: Text.Fit
                    font.pixelSize:24
                    color:Colors.currentTheme.textColor
                    text:"Color Picker"
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                            radius: colorpickerButton.radius
                            color: Colors.currentTheme.backgroundControls
                            opacity: colorpickerButton.checked?0.5:1
                            border.color:Colors.currentTheme.borderColor
                }
                action: Action{
                    shortcut: "X"
                    onTriggered:{
                        checked=true
                        if(view.currentItem!==colorpicker){
                            view.replace(colorpicker);
                        }
                    }
                }
            }
            RoundButton{
                id:urlencoderButton
                radius:30
                Layout.fillHeight:true
                Layout.preferredWidth:parent.width/3
                Layout.minimumWidth:100
                contentItem:Text{
                    fontSizeMode: Text.Fit
                    font.pixelSize:24
                    color:Colors.currentTheme.textColor
                    text:"URL Encode/Decode"
                    horizontalAlignment:Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                            radius: urlencoderButton.radius
                            color: Colors.currentTheme.backgroundControls
                            opacity: urlencoderButton.checked?0.5:1
                            border.color:Colors.currentTheme.borderColor
                }
                action: Action{
                    shortcut: "C"
                    onTriggered:{
                        checked=true
                        if(view.currentItem!==urlencoder){
                            view.replace(urlencoder);
                        }
                    }
                }
            }
        }
    }
    Settings{
        id:settings
        property string theme:"dark"
    }

    ConverterItem{
        id: converter
    }
    ColorpickerItem{
        id: colorpicker
    }
    UrlencoderItem{
        id:urlencoder
    }
}
