import QtQuick.Layouts
import QtQuick
import QtQuick.Controls
import Simple

Rectangle{
    id:root
    visible:false
    color:Colors.currentTheme.background
    MouseArea {
            anchors.fill: parent
            onClicked: forceActiveFocus()
    }
    ColumnLayout{
        anchors.fill:parent
        Text{
            Layout.alignment:Qt.AlignHCenter
            color:Colors.currentTheme.textColor
            text:"<h1>CONVERTER</h1>"
        }
        Item{
            Layout.alignment:Qt.AlignHCenter
            Layout.maximumWidth:Screen.desktopAvailableWidth/4
            Layout.minimumWidth:150
            Layout.preferredWidth:parent.width/2
            Layout.preferredHeight:parent.height/6
            Text{
                anchors.right:decimalfield.left
                anchors.verticalCenter:decimalfield.verticalCenter
                color:Colors.currentTheme.textColor
                text:"Decimal:"
                font.pixelSize:24
            }
            TextField{
                id:decimalfield
                width:parent.width
                height:parent.height
                color:Colors.currentTheme.textColor
                Layout.alignment:Qt.AlignHCenter
                font.pixelSize:24
                verticalAlignment: TextInput.AlignTop
                leftPadding: 15
                rightPadding:15
                wrapMode:Text.Wrap
                validator: RegularExpressionValidator{
                    regularExpression:/[0-9]+/
                }
                onTextChanged: {
                    binaryfield.text=converter.convert_from_to(text,1,0);
                    hexfield.text=converter.convert_from_to(text,1,2);
                }
                background: Rectangle{
                    border.color:Colors.currentTheme.borderColor
                    color: Colors.currentTheme.backgroundControls
                    anchors.fill:parent
                    radius:30
                }
            }
        }
        Image{
            Layout.alignment:Qt.AlignHCenter
            Layout.preferredWidth:binaryfield.width/2
            Layout.preferredHeight:binaryfield.height/2
            fillMode: Image.PreserveAspectFit
            source:Colors.currentTheme===Colors.dark?"qrc:/images/white_arrows.png":"qrc:/images/arrows.png"
        }
        Item{
            Layout.alignment:Qt.AlignHCenter
            Layout.maximumWidth:Screen.desktopAvailableWidth/4
            Layout.minimumWidth:150
            Layout.preferredWidth:parent.width/2
            Layout.preferredHeight:parent.height/6
            Text{
                anchors.right:binaryfield.left
                anchors.verticalCenter:binaryfield.verticalCenter
                color:Colors.currentTheme.textColor
                text:"Binary:"
                font.pixelSize:24
            }

            TextField{
                id:binaryfield
                font.pixelSize:24
                color:Colors.currentTheme.textColor
                width:parent.width
                height:parent.height
                verticalAlignment: TextInput.AlignTop
                leftPadding: 15
                rightPadding:15
                wrapMode:Text.Wrap

                validator: RegularExpressionValidator{
                    regularExpression:/[0-1]+/
                }
                onTextChanged: {
                    decimalfield.text=converter.convert_from_to(text,0,1);
                    hexfield.text=converter.convert_from_to(text,0,2);
                }
                background: Rectangle{
                    border.color:Colors.currentTheme.borderColor
                    color: Colors.currentTheme.backgroundControls
                    anchors.fill:parent
                    radius:30
                }
            }
        }


        Image{
            Layout.alignment:Qt.AlignHCenter
            Layout.preferredWidth:binaryfield.width/2
            Layout.preferredHeight:binaryfield.height/2
            fillMode: Image.PreserveAspectFit
            source:Colors.currentTheme===Colors.dark?"qrc:/images/white_arrows.png":"qrc:/images/arrows.png"
        }

        Item{
            Layout.alignment:Qt.AlignHCenter
            Layout.maximumWidth:Screen.desktopAvailableWidth/4
            Layout.minimumWidth:150
            Layout.preferredWidth:parent.width/2
            Layout.preferredHeight:parent.height/6
            Text{
                anchors.right:hexfield.left
                anchors.verticalCenter:hexfield.verticalCenter
                color:Colors.currentTheme.textColor
                text:"Hex:"
                font.pixelSize:24
            }
            TextField{
                id:hexfield
                width:parent.width
                height:parent.height
                Layout.alignment:Qt.AlignHCenter
                color:Colors.currentTheme.textColor
                font.pixelSize:24
                verticalAlignment: TextInput.AlignTop
                leftPadding: 15
                rightPadding:15
                wrapMode:Text.Wrap
                validator: RegularExpressionValidator{
                    regularExpression:/[0-9a-f]+/
                }
                onTextChanged: {
                    binaryfield.text=converter.convert_from_to(text,2,0);
                    decimalfield.text=converter.convert_from_to(text,2,1);
                }
                background: Rectangle{
                    border.color:Colors.currentTheme.borderColor
                    color: Colors.currentTheme.backgroundControls
                    anchors.fill:parent
                    radius:30
                }
            }
        }


        Item{
            Layout.fillHeight:true
        }
    }
    Converter{
        id:converter
    }

}
