import QtQml 2.15
import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore

Item {
    id: compact

    PlasmaComponents.Button {
        id: showButton
        text: "🔍"
        font.bold: true
        font.pixelSize: parent.width / 2
        x: 0
        y: 0
        width: parent.width
        height: parent.height

        onClicked: {
            widget.expanded = !widget.expanded
        }
    }
}
