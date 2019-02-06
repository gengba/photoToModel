import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Layouts 1.1
import QtQml.Models 2.2
import QtQml 2.2
import QtQuick.Dialogs 1.3


Item {
    Controls1.SplitView {
        anchors.fill: parent

        Controls1.SplitView {
            orientation: Qt.Vertical
            Layout.fillHeight: true

            Rectangle {
                border { width: 0.5 }
                Layout.minimumWidth: 160
                width: 200
                
                GridLayout {
                    Layout.preferredWidth: parent.width
                    columns: (Layout.preferredWidth / 100)
                    Layout.alignment: Qt.AlignHCenter
                    
                    Item {
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                imgView.source = showImgs.source
                            }
                            ColumnLayout{
                                Image {
                                    id: showImgs
                                    Layout.preferredWidth: 80
                                    Layout.preferredHeight: 80
                                    source: "file:///C:/Users/gengba/Desktop/gxu.jpg"
                                }
                                Label {
                                    text: "img_1.jpg"
                                    font.pointSize: 8 
                                }
                            }
                        }
                    }
                    Item {
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                imgView.source = showImgs_2.source
                            }
                            ColumnLayout{
                                Image {
                                    id: showImgs_2
                                    Layout.preferredWidth: 80
                                    Layout.preferredHeight: 80
                                    source: "file:///C:/Users/gengba/Desktop/gxu_2.jpg"
                                }
                                Label {
                                    text: "img_1.jpg"
                                    font.pointSize: 8 
                                }
                            }
                        }
                    }
                    Item {
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                imgView.source = showImgs_3.source
                            }
                            ColumnLayout{
                                Image {
                                    id: showImgs_3
                                    Layout.preferredWidth: 80
                                    Layout.preferredHeight: 80
                                    source: "file:///C:/Users/gengba/Desktop/gxu_3.jpg"
                                }
                                Label {
                                    text: "img_1.jpg"
                                    font.pointSize: 8 
                                }
                            }
                        }
                    }
                    Item {
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                imgView.source = showImgs_4.source
                            }
                            ColumnLayout{
                                Image {
                                    id: showImgs_4
                                    Layout.preferredWidth: 80
                                    Layout.preferredHeight: 80
                                    source: "file:///C:/Users/gengba/Desktop/gxu.jpg"
                                }
                                Label {
                                    text: "img_1.jpg"
                                    font.pointSize: 8 
                                }
                            }
                        }
                    }
                    Item {
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                imgView.source = showImgs_5.source
                            }
                            ColumnLayout{
                                Image {
                                    id: showImgs_5
                                    Layout.preferredWidth: 80
                                    Layout.preferredHeight: 80
                                    source: "file:///C:/Users/gengba/Desktop/gxu.jpg"
                                }
                                Label {
                                    text: "img_1.jpg"
                                    font.pointSize: 8 
                                }
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            border { width: 0.5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumWidth: 40

            Image {
                id: imgView
                // Layout.fillHeight: true
                // Layout.fillWidth: true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle {
            border { width: 0.5 }
            width: Math.round(parent.width * 0.45)
            Layout.minimumWidth: 40
        }
    }
}
