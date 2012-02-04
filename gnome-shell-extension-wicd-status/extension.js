// Creates a system status notification icon for pidgin

const StatusIconDispatcher = imports.ui.statusIconDispatcher;

function enable() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['wicd-client.py'] = 'wicd-client.py';
}

function disable() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['wicd-client.py'] = '';
}

// gnome-shell extension entry point
function init(metadata) {
    //do nothing?..//
}
