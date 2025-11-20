import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid

PlasmoidItem {

    Layout.minimumWidth: 100
    Layout.minimumHeight: 100

    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        PlasmaComponents.Text {
            text: "Youtube Search"
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
        }

        PlasmaComponents.TextField {
            id: searchField
            visible: false
            placeholderText: qsTr("Search Youtube...")
            Layout.fillWidth: true

            onAccepted: {
                Qt.openUrlExternally("https://www.youtube.com/results?search_query=" + encodeURIComponent(text))
            }
        }

        PlasmaComponents.Button {
            id: showButton

            onClicked: searchField.visible = !searchField.visible
        }
    }
}


