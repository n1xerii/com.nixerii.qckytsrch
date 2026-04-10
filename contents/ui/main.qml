import QtQml 2.15
import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore

PlasmoidItem {
    id: widget

    Plasmoid.icon: 'starred-symbolic'
    hideOnWindowDeactivate: true

    width: 180
    height: 75

    compactRepresentation: Compact {}
    fullRepresentation: Full {}
}
