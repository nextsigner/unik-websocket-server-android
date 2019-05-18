import QtQuick 2.0
import QtQuick.Controls 2.0
import Qt.WebSockets 1.0

Item {
    id: r
    anchors.fill: parent
    property string ip: '127.0.0.1'
    property int port: 12345
    property string serverName: 'chatserver'
    property var container: xQmlObjects
    Component.onCompleted:{
        unik.startWSS('192.168.200.2', 5500,'chatserver');
    }
    Item {
        id: xQmlObjects
        anchors.fill: r
    }
    Image{
        id: i1
        anchors.centerIn: r
    }
    Image{
        id: i2
        anchors.centerIn: r
    }
    Connections {
        id:connCW
        //target: cw
        onClientConnected:{
            //unik.log("A new client connected.")
            //console.log("A new client connected.")
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
            unik.log("User List Changed!")
            //console.log("User List Changed!")
            //listModelUser.updateUserList()
        }
        property int v: 0
        onNewMessage:{
            //unik.debugLog=true

            //unik.log('-------->'+user+':::"'+unik.base64ToByteArray(msg)+'"')
            //unik.setFile('/tmp/wss2.ogg', unik.base64ToByteArray(msg))
            //unik.appendAudioStreamFileWSS('/tmp/streamOutPut--'+v+'.ogg', msg)
            //v++
            //return
            /*if((''+msg).substring(0,6).indexOf('audio')>=0){
                unik.appendAudioStreamFileWSS('/tmp/streamOutPut.ogg', (''+msg).substring(5, (''+msg).length-2))
                unik.log('-------->'+(''+msg).substring(5, (''+msg).length-2))
                return
            }*/
            if(i1.z<i2.z){
                i2.source="data:image/png;base64,"+msg
                //i1.z++
            }else{
                i1.source="data:image/png;base64,"+msg
                //i2.z++
            }
            /*console.log('A new message: '+user+' say: '+msg)
            var obj = Qt.createQmlObject(msg, r.container, 'unikastcode')
            if(app){
                app.active=true
            }*/
            //listModelMsg.addMsg('['+time+']'+user+':'+msg)
        }
    }
    /*Column{
        anchors.fill: parent
        Row{
            width: parent.width
            height: parent.height-28
            Rectangle{
                width: parent.width*0.7
                height: parent.height
                border.width: 1
                clip: true
                Rectangle{
                    width: parent.width
                    height: 28
                    color: "black"
                    Text {
                        text: "<b>Messages</b>"
                        font.pixelSize: 24
                        anchors.centerIn: parent
                        color: "white"
                    }
                }
                ListView{id:msgListView;width: parent.width; height: parent.height-28; y:28; spacing: 10; clip: true; model: listModelMsg; delegate: delegateMsg;}
            }
            Rectangle{
                width: parent.width*0.3
                height: parent.height
                border.width: 1
                clip: true
                Rectangle{
                    width: parent.width
                    height: 28
                    color: "black"
                    Text {
                        text: "<b>User List</b>"
                        font.pixelSize: 24
                        anchors.centerIn: parent
                        color: "white"
                    }
                }
                ListView{id:userListView;width: parent.width; height: parent.height-28; y:28; spacing: 10; clip: true; model: listModelUser; delegate: delegateUser;}
            }
        }
    }
    ListModel{
        id: listModelUser
        function createElement(u){
            return {
                user: u
            }
        }
        function updateUserList(){
            clear()
            var ul = cs.userList;
            for(var i=0; i < ul.length; i++){
                append(createElement(ul[i]))
            }
        }
    }
    ListModel{
        id: listModelMsg
        function createElement(m){
            return {
                msg: m
            }
        }
        function addMsg(msg){
            append(createElement(msg))
            msgListView.currentIndex = count-1
        }
    }
    Component{
        id: delegateUser
        Rectangle{
            width: userListView.width*0.9
            height: 24
            border.width: 1
            color: "#cccccc"
            radius: 6
            anchors.horizontalCenter: parent.horizontalCenter
            clip:true
            Text {
                text: "<b>"+user+"</b>"
                font.pixelSize: 20
                anchors.centerIn: parent
            }
        }
    }
    Component{
        id: delegateMsg
        Rectangle{
            width: msgListView.width*0.9
            height: txtMsg.contentHeight
            border.width: 1
            color: "#cccccc"
            radius: 6
            anchors.horizontalCenter: parent.horizontalCenter
            clip:true
            Text {
                id: txtMsg
                width: parent.width-48
                height: contentHeight
                text: "<b>"+msg+"</b>"
                font.pixelSize: 20
                anchors.centerIn: parent
                wrapMode: Text.WordWrap
            }
        }
    }
*/
    function clear(){
        for(var i=0;i<xQmlObjects.children.length;i++){
            xQmlObjects.children[i].destroy(1)
        }
    }
}
