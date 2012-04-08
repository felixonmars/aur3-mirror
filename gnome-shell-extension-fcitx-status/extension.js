// Creates a system status notification icon for skype
 
const StatusIconDispatcher = imports.ui.statusIconDispatcher;

function enable() {
	StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['fcitx'] = 'fcitx';
}

function disable() {
	StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['fcitx'] = '';
}

function init() {
}

