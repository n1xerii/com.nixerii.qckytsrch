import QtQuick
import QtQuick.Layouts
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid


PlasmoidItem {
    id: root

    function togglePopup() {
        if (popup.visible == true) {
            popup.close()
        }
        else {
            popup.open()
        }
    }

    PlasmaComponents.Button {
        id: showButton
        text: "SEARCH"
        font.bold: true
        width: parent.width
        height: parent.height
        font.pixelSize: 20

        onClicked: togglePopup()
    }

    PlasmaComponents.Popup {
        id: popup
        width: showButton.width
        height: showButton.height

        PlasmaComponents.TextField {
            id: searchField
            width: showButton.width / 2
            height: showButton.height / 3

            placeholderText: qsTr("Search Youtube...")

            onAccepted: {
                Qt.openUrlExternally(
                    "https://www.youtube.com/results?search_query=" + encodeURIComponent(text)
                )
                popup.close()
            }
        }
    }
}
