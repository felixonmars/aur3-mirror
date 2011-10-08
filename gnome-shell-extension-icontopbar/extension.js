const StatusIconDispatcher = imports.ui.statusIconDispatcher;

function init() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['skype'] = 'skype';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['pidgin'] = 'pidgin';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['empathy'] = 'empathy';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['gajim'] = 'gajim';

    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['parcellite'] = 'parcellite';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['transmission-gtk'] = 'transmission-gtk';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['opera'] = 'opera';

    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['vlc'] = 'vlc';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['rhythmbox'] = 'rhythmbox';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['deadbeef'] = 'deadbeef';
}
