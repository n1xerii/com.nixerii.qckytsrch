import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.plasmoid


PlasmoidItem {
    id: root

    Layout.minimumWidth: 100 * PlasmaCore.Units.devicePixelRatio
    Layout.minimumHeight: 60 * PlasmaCore.Units.devicePixelRatio
    hideOnWindowDeactivate: true

    function togglePopup() {
        switch(searchPopup.visible) {
            case true:
                searchPopup.close()
                break
            case false:
                searchPopup.open()
                break
            default:
                searchPopup.close()
                break
        }
    }

    PlasmaComponents.Button {
        id: showButton
        text: "🔍"
        font.bold: true
        width: parent.width
        height: parent.height
        font.pixelSize: 20

        onClicked: togglePopup()

        PlasmaComponents.Popup {
            id: searchPopup
            width: parent.width
            height: parent.height / 1.5
            y: parent.y - parent.height / 1.5

            PlasmaComponents.TextField {
                id: searchField
                width: parent.width
                height: parent.height

                placeholderText: qsTr("Search Youtube...")

                onAccepted: {
                    Qt.openUrlExternally(
                        "https://www.youtube.com/results?search_query=" + encodeURIComponent(text)
                    )
                    searchField.clear()
                    popup.close()
                }
            }
        }
    }

}
