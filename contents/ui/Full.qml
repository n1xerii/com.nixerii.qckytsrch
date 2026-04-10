import QtQml 2.15
import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore

Item {
    id: full

    PlasmaComponents.TextField {
        id: searchField
        //anchors.fill: parent
        width: parent.width
        height: parent.height

        placeholderText: "Search Youtube..."

        onAccepted: {
            Qt.openUrlExternally(
                "https://www.youtube.com/results?search_query=" + encodeURIComponent(text)
            )
            text = ""
            widget.expanded = false
        }
    }
}
