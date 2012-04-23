// Creates a system status notification icon for pnmixer

const StatusIconDispatcher = imports.ui.statusIconDispatcher;

function enable() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['pnmixer'] = 'pnmixer';
}

function disable() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['pnmixer'] = '';
}

// gnome-shell extension entry point
function init(metadata) {
    //do nothing?..//
}
