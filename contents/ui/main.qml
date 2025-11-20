import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid

PlasmoidItem {
    id: root

    Layout.preferredWidth: showButton.implicitWidth
    Layout.preferredHeight: showButton.implicitHeight
    Layout.minimumWidth: showButton.implicitWidth
    Layout.minimumHeight: showButton.implicitHeight

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
        text: "Search"
        width: 70
        height: 35

        onClicked: togglePopup()
    }

    PlasmaComponents.Popup {
        id: popup
        modal: false
        focus: true

        x: showButton.x - showButton.width + 12.5
        y: showButton.y - height

        width: 185

        Layout.alignment: Qt.AlignHCenter

        ColumnLayout {
            PlasmaComponents.Label {
                id: searchLabel
                text: "YOUTUBE SEARCH"
                font.bold: true

                Layout.alignment: Qt.AlignHCenter
            }

            PlasmaComponents.TextField {
                id: searchField
                placeholderText: qsTr("Search Youtube...")

                Layout.alignment: Qt.AlignHCenter

                onAccepted: {
                    Qt.openUrlExternally(
                        "https://www.youtube.com/results?search_query=" + encodeURIComponent(text)
                    )
                    popup.close()
                }
            }
        }
    }
}
