import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3


/**
    添加头部和底部样式组件
*/
Page {
    id: root
    property alias headerBar: headerLayout.data
    property alias footerContent: footerLayout.data
    property alias icon: iconPlaceHolder.data

    clip: true

    // 自定义属性
    QtObject {
        id: m
        property int headerHeight: 24
        property int footerHeight: 22
        property int hPadding: 6
        property int vPadding: 2
        readonly property color paneBackgroundColor: "lightslategray"
    }

    padding: 2

    // 头部标题栏
    header: Pane {
        id: headerPane
        topPadding: m.vPadding; bottomPadding: m.vPadding
        leftPadding: m.hPadding; rightPadding: m.hPadding
        background: Rectangle { color: m.paneBackgroundColor }

        Item {
            implicitHeight: m.headerHeight
            width: parent.width
            RowLayout {
                anchors.fill: parent

                Item {
                    id: iconPlaceHolder
                    width: childrenRect.width
                    height: childrenRect.height
                    Layout.alignment: Qt.AlignVCenter
                    visible: icon != ""
                }
                Label {
                    text: root.title
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                }
                Row { id: headerLayout }
            }
        }
    }

    // 底部
    footer: Pane {
        id: footerPane
        topPadding: m.vPadding; bottomPadding: m.vPadding
        leftPadding: m.hPadding; rightPadding: m.hPadding
        visible: footerLayout.childern.length > 0
        background: Rectangle { color: m.paneBackgroundColor }

        Item {
            id: footerLayout
            width: parent.width
            implicitHeight: m.footerHeight
        }
    }
}
