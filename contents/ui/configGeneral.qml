import QtQuick 2.0
import QtQuick.Layouts
import QtQuick.Controls 2.5 as QQC2
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
    id: page

    property alias cfg_useDuckDuckGo: useDuckDuckGo.checked
    property alias cfg_useGoogle: useGoogle.checked
    property alias cfg_useYoutube: useYoutube.checked
    property alias cfg_useWikipedia: useWikipedia.checked

    property alias cfg_useCustomService: useCustomService.checked
    property alias cfg_customServiceLink: customServiceLink.text

    Kirigami.Separator {
        Kirigami.FormData.isSection: true
        Kirigami.FormData.label: i18n("Service")
    }

    ColumnLayout {
        QQC2.RadioButton {
            id: useDuckDuckGo
            text: qsTr("DuckDuckGo")
        }
        QQC2.RadioButton {
            id: useGoogle
            text: qsTr("Google")
        }
        QQC2.RadioButton {
            id: useYoutube
            text: qsTr("Youtube")
        }
        QQC2.RadioButton {
            id: useWikipedia
            text: qsTr("Wikipedia")
        }

        QQC2.RadioButton {
            id: useCustomService
            text: qsTr("Custom")
        }
        QQC2.TextField {
            id: customServiceLink
            placeholderText: i18n("www.something.com/query=")
        }
    }
}
