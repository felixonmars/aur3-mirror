// Creates a system status notification icon for skype
 
const StatusIconDispatcher = imports.ui.statusIconDispatcher;
 
// gnome-shell extension entry point
function init() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['skype'] = 'skype';
}
