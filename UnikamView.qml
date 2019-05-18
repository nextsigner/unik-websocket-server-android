import QtQuick 2.0

Item {
    id: r
    anchors.fill: parent
    Text {
        id: info
        text: r.byDefault?'Default: '+r.ip+':'+r.port:'Seted: '+r.ip+':'+r.port
        font.pixelSize: 10
        color: 'white'
    }
    Connections {
        id:connCW
        onClientConnected:{
            console.log("A new client connected.")
        }
    }
    Timer{
        running:true
        repeat:true
        interval: 1000
        onTriggered: {
            if(cw){
                connCW.target=cw
                stop()
            }
        }
    }
    Connections {
        target: cs
        onUserListChanged:{
            //listModelUser.updateUserList()
        }
        onNewMessage:{
            var c='import QtQuick 2.0\n'
            c+='Image{\n'
            c+='    id: r;\n'
            c+='    anchors.centerIn:parent\n'
            c+='    source:"data:image/png;base64,"+'+msg+';\n'
            c+='    Component.onCompleted: r.destroy(200)\n'
            c+='}'
            var comp=Qt.createQmlObject(c, r, 'codeWSS')
        }
    }
}

