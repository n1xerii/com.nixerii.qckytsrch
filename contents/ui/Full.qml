import QtQml 2.15
import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore

Item {
    id: full

    Layout.minimumWidth: 100
    Layout.minimumHeight: 45

    RowLayout {
        id: fullRow

        anchors.fill: parent
        spacing: 2

        PlasmaComponents.Button {
            id: homepageButton

            Layout.fillWidth: true
            Layout.fillHeight: true

            text: plasmoid.configuration.buttonSymbol

            onClicked: {

            }
        }

        PlasmaComponents.TextField {
            id: searchField

            Layout.fillWidth: true
            Layout.fillHeight: true

            placeholderText: "Search 🔍"

            onAccepted: {
                if (plasmoid.configuration.useDuckDuckGo == true) {
                    aio_search("DuckDuckGo", text)
                }
                else if (plasmoid.configuration.useGoogle == true) {
                    aio_search("Google", text)
                }
                else if (plasmoid.configuration.useYoutube == true) {
                    aio_search("Youtube", text)
                }
                else if (plasmoid.configuration.useWikipedia == true) {
                    aio_search("Wikipedia", text)
                }
                else if (plasmoid.configuration.useCustomService == true) {
                    aio_search("Custom", text)
                }
                else {
                    aio_search("DuckDuckGo", text)
                }

                text = ""
                widget.expanded = false
            }
        }
    }

    function aio_search(serviceName, query) {
        var serviceLink = ""
        var serviceQuery = query

        switch(serviceName) {
            case "DuckDuckGo":
                serviceLink = "https://duckduckgo.com/?q="
                break
            case "Google":
                serviceLink = "https://www.google.com/search?q="
                break
            case "Youtube":
                serviceLink = "https://www.youtube.com/results?search_query="
                break
            case "Wikipedia":
                serviceLink = "https://en.wikipedia.org/wiki/"
                break
            case "Custom":
                serviceLink = plasmoid.configuration.customServiceLink
                break
            default:
                serviceLink = "https://duckduckgo.com/?q="
                break
        }

        if (serviceLink == null || serviceLink == "") { return }

        Qt.openUrlExternally(
            serviceLink + encodeURIComponent(serviceQuery)
        )
    }
}
