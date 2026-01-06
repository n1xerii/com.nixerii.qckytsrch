import QtQuick
import QtQuick.Layouts
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid


PlasmoidItem {
    id: root

    hideOnWindowDeactivate: true

    function togglePopup() {
        if (popup.visible === true) {
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
        //width: parent.width
        //height: parent.height / 2
        font.pixelSize: 20

        onClicked: togglePopup()

        PlasmaComponents.Popup {
            id: searchPopup
            //width: parent.width
            //height: parent.height

            PlasmaComponents.TextField {
                id: searchField
                //width: parent.width
                //height: parent.height / 2

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

}
