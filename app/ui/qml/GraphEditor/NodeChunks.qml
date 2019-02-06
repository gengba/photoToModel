import QtQuick 2.7
import "common.js" as common


ListView {
    id: root
    interactive: false

    SystemPalette { id: activePalette }

    property color defaultColor: Qt.darker(activePalette.window, 1.1)
    property real chunkHeight: height
    property real chunkWidth: model ? width / model.count : 0
    
}
