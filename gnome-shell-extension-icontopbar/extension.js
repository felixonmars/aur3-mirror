const StatusIconDispatcher = imports.ui.statusIconDispatcher;

function init() {
}

function enable() {
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['skype'] = 'skype';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['pidgin'] = 'pidgin';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['gajim.py'] = 'gajim.py';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['xchat'] = 'xchat';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['instantbird'] = 'instantbird';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['emesene'] = 'emesene';

    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['transmission-gtk'] = 'transmission-gtk';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['opera'] = 'opera';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['thunderbird-bin'] = 'thunderbird-bin';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['dropbox'] = 'dropbox';

    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['vlc'] = 'vlc';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['rhythmbox'] = 'rhythmbox';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['deadbeef'] = 'deadbeef';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['banshee'] = 'banshee';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['clementine'] = 'clementine';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['audacious'] = 'audacious';

    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['parcellite'] = 'parcellite';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['radiotray'] = 'radiotray';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['shutter'] = 'shutter';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['clipit'] = 'clipit';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['fluxgui.py'] = 'fluxgui.py';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['keepassx'] = 'keepassx';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['truecrypt'] = 'truecrypt';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['wicd-client.py'] = 'wicd-gtk';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['gigolo'] = 'gigolo';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['quicksynergy'] = 'quicksynergy';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['pac'] = 'pac';
    StatusIconDispatcher.STANDARD_TRAY_ICON_IMPLEMENTATIONS['remmina'] = 'remmina';

}

function disable() {
}
