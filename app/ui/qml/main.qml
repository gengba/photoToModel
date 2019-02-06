import QtQuick 2.7
import QtQuick.Controls 2.3
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Layouts 1.1
import QtQml.Models 2.2
import QtQml 2.2
import QtQuick.Dialogs 1.3



ApplicationWindow {
    id: _window
    title: "Test App"
    width: 1200
    height: 800
    visible: true

    SystemPalette { id: activePalette }
    SystemPalette { id: disablePalette; colorGroup: SystemPalette.Disabled }

    FileDialog {
        id: openFileDialog
        title: "Open Files"
        nameFilters: ["Image Files(*.jpg)"]
        folder: shortcuts.desktop
        onAccepted: {
            console.log("You chose: " + openFileDialog.fileUrls)
            // showImgs.source = "" + openFileDialog.fileUrls
            // col_1.visible = true
            // showImgs_2.source = "" + openFileDialog.fileUrls
            // showImgs_3.source = "" + openFileDialog.fileUrls
            // showImgs_4.source = "" + openFileDialog.fileUrls
            // showImgs_5.source = "" + openFileDialog.fileUrls
            // Qt.quit()
        }
    }

    Action {
        id: undoAction
        property string tooltip: "Undo"
        text: "Undo"
        shortcut: "Ctrl+Z"
    }
    Action {
        id: redoAction
        property string tooltip: "Redo"
        text: "Redo"
        shortcut: "Ctrl+Y"
    }
    menuBar: MenuBar {
        palette.window: Qt.darker(activePalette.window, 1.15)
        Menu {
            title: "File"
            Action {
                text: "New"
                shortcut: "Ctrl+N"
            }
            Action {
                text: "Open"
                shortcut: "Ctrl+O"
                onTriggered: openFileDialog.open()
            }
            Action {
                id: saveAction
                text: "Save"
                shortcut: "Ctrl+S"
            }
            Action {
                id: saveAsAction
                text: "Save As..."
                shortcut: "Ctrl+Shift+S"
            }
            MenuSeparator {}
            Action {
                text: "Quit"
                onTriggered: Qt.quit()
            }
        }
        Menu {
            title: "Edit"
            MenuItem {
                action: undoAction
                ToolTip.visible: hovered
                ToolTip.text: undoAction.tooltip
            }
            MenuItem {
                action:redoAction
                ToolTip.visible: hovered
                ToolTip.text: redoAction.tooltip
            }
        }
        Menu {
            title: "View"
            MenuItem {
                id: graphEditorVisibilityCB
                text: "Graph Editor"
                checkable: true
                checked: true
            }
            MenuItem {
                id: liveSfMVisibilityCB
                text: "Live Reconstruction"
                checkable: true
                checked: false
            }
            MenuSeparator {}
            Action {
                text: "Fullscreen"
                checkable:true
                checked: _window.visibility == ApplicationWindow.FullScreen
                shortcut: "Ctrl+F"
                onTriggered: _window.visibility == ApplicationWindow.FullScreen ? _window.showNormal() : showFullScreen()
            }
        }
        Menu {
            title: "Help"
            Action {
                text: "About App"
                // onTriggered: aboutDialog.open()
                shortcut: "F1"
            }
        }
    }

    header: ToolBar {
        id: toolbar
        padding: 0
        leftPadding: 4
        rightPadding: 4
        ToolTip.toolTip.background: Rectangle {
            color: activePalette.base
            border.color: activePalette.mid
        }
        RowLayout {
            ToolButton {
                // 设置提示文字
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Create new File")
                // 设置命令图标
                icon.name: "New"
                icon.source: "../img/new.png"
            }
            ToolButton {
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Open File")
                icon.name: "Open"
                icon.source: "../img/open.png"
                onClicked: openFileDialog.open()
            }
            ToolButton {
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Save File")
                icon.name: "Open"
                icon.source: "../img/open.png"
            }
        }
    }

    Controls1.SplitView {
        anchors.fill: parent
        orientation: Qt.Vertical
        ToolTip.toolTip.background: Rectangle {
            color: activePalette.base
            border.color: activePalette.mid
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.topMargin: 2
            implicitHeight: Math.round(parent.height * 0.7)
            spacing: 4

            RowLayout {
                Layout.rightMargin: 4
                Layout.leftMargin: 4
                Layout.fillWidth: false
                Layout.alignment: Qt.AlignHCenter

                Row {
                    spacing: 20
                    Button {
                        property color buttonColor: Qt.darker("#4CAF50", 1.8)
                        text: "Start"
                    }
                    Button {
                        text: "Stop"
                    }
                    Button {
                        visible: true
                        text: "Submit"
                    }
                }
            }
            WorkspaceView {
                id: workspaceView
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        Controls1.SplitView {
            orientation: Qt.Horizontal
            width: parent.width
            height: Math.round(parent.height * 0.3)
            visible: true

            Rectangle {
                id: graphEditorPanel
                Layout.fillWidth: true
                border { width: 0.5 }
                RowLayout {
                    Button {
                        text: "button1"
                        font.pointSize: 11
                    }
                }

                Rectangle{
                    id: graphEditor
                    border { width: 0.5 }
                    anchors.fill: parent
                }
            }

            Rectangle{
                width: Math.round(parent.width * 0.3)
                border { width: 0.5 }
            }
        }
    }

}