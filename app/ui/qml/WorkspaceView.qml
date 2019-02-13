import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Layouts 1.1
import QtQml.Models 2.2
import QtQml 2.2
import QtQuick.Dialogs 1.3
import QtQuick.Scene3D 2.0
import "Controls"


Item {
    Controls1.SplitView {
        anchors.fill: parent

        Controls1.SplitView {
            orientation: Qt.Vertical
            Layout.fillHeight: true

            Panel {
                title: "images"
                Layout.minimumWidth: 200
                width: 220
                
                GridLayout {
                    Layout.preferredWidth: parent.width
                    columns: (Layout.preferredWidth / 100)
                    Layout.alignment: Qt.AlignHCenter
                    rowSpacing: 10
                    
                    Item {
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 100
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                image.source = showImgs.source
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
                                image.source = showImgs_2.source
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
                                image.source = showImgs_3.source
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
                                image.source = showImgs_4.source
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
                                image.source = showImgs_5.source
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
        Panel {
            title: "Image Viewer"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumWidth: 40

            Image {
                id: image
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Panel {
            title: "3D Viewer"
            width: Math.round(parent.width * 0.45)
            Layout.minimumWidth: 40

            Scene3D {
                id: scene3D
                anchors.fill: parent
                cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
                hoverEnabled: true
                aspects: ['logic', 'input']
                focus: true
            }
        }
    }
}
