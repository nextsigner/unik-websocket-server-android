import QtQuick 2.0
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0

Rectangle {
    id: r
    color: app.color
    anchors.fill: parent
    Settings{
        id: unikamSettings
        category: 'conf-unikam-wss-'+app.moduleName
        property string ip
        property string port
    }
    Column{
        spacing: app.fs*0.5
        Text{
            text: 'Setup WebSockets Connection '
            font.pixelSize: app.fs
            color:app.c2
        }
        Item {width: 2;height: app.fs}
        Row{
            spacing: app.fs*0.5
            Text{
                text: 'WebSockets IP: '
                font.pixelSize: app.fs
                color:app.c2
            }
            TextInput{
                id:tiIp
                width: r.width*0.5
                height: app.fs*1.2
                font.pixelSize: app.fs
                color:app.c2
                anchors.verticalCenter: parent.verticalCenter
                cursorDelegate: Rectangle{
                    id:cte2
                    width: app.fs*0.25
                    height: app.fs
                    color:v?app.c2:'transparent'
                    property bool v: true
                 }
                //Keys.onReturnPressed:r.url=tiWebSocketUrl.text
                Rectangle{
                    width: parent.width+app.fs*0.25
                    height: parent.height+app.fs*0.25
                    color: 'transparent'
                    anchors.centerIn: parent
                    border.width: 1
                    border.color: app.c2
                }
            }
        }
        Row{
            spacing: app.fs*0.5
            Text{
                text: 'WebSockets PORT: '
                font.pixelSize: app.fs
                color:app.c2
            }
            TextInput{
                id:tiPort
                width: r.width*0.5
                height: app.fs*1.2
                font.pixelSize: app.fs
                color:app.c2
                anchors.verticalCenter: parent.verticalCenter
                cursorDelegate: Rectangle{
                    id:cte2
                    width: app.fs*0.25
                    height: app.fs
                    color:v?app.c2:'transparent'
                    property bool v: true
                 }
                //Keys.onReturnPressed:r.url=tiWebSocketUrl.text
                Rectangle{
                    width: parent.width+app.fs*0.25
                    height: parent.height+app.fs*0.25
                    color: 'transparent'
                    anchors.centerIn: parent
                    border.width: 1
                    border.color: app.c2
                }
            }
        }

        Button{
            text: 'Iniciar '+app.moduleName
            font.pixelSize: app.fs
            anchors.right: parent.right
            onClicked: {
                var c=unik.startWSS(tiIp.text, tiPort.text, 'chatserver')
                if(c){
                    unikamSettings.ip=tiIp.text
                    unikamSettings.port=tiPort.text
                }
                r.visible=!c
            }
        }
    }
    Component.onCompleted: {
        if(unikamSettings.ip===''){
            unikamSettings.ip='127.0.0.1'
        }
        if(unikamSettings.port===''){
            unikamSettings.port='5500'
        }
        tiIp.text=unikamSettings.ip
        tiPort.text=unikamSettings.port
    }
}
