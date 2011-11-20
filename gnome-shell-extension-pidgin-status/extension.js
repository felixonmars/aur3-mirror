// Creates a system status notification icon for pidgin

const StatusIconDispatcher = imports.ui.statusIconDispatcher;

function enable() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['pidgin'] = 'pidgin';
}

function disable() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['pidgin'] = '';
}

// gnome-shell extension entry point
function init(metadata) {
    //do nothing?..//
}
