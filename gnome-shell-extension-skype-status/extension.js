// Creates a system status notification icon for skype
 
const StatusIconDispatcher = imports.ui.statusIconDispatcher;
 
function enable() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['skype'] = 'skype';
}

function disable() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['skype'] = '';
}

// gnome-shell extension entry point
function init() {
    //do nothing?..//
}
