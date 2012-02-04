const Lang = imports.lang;
const St = imports.gi.St;
const Main = imports.ui.main;
const PanelMenu = imports.ui.panelMenu;
const Util = imports.misc.util;
const GLib = imports.gi.GLib;

function ForceQuit() {
    this._init();
}

ForceQuit.prototype = {
    __proto__: PanelMenu.SystemStatusButton.prototype,

    _init: function() {
        PanelMenu.SystemStatusButton.prototype._init.call(this, 'start-here');
        this._button = new St.Button();
        this._button.set_tooltip_text('Click me and select a Window to kill!');
        this._button.set_child(new St.Icon({
            icon_name: 'window-close',
            icon_size: 17
        }));
        this._button.connect('clicked', Lang.bind(this, function () {
            Util.spawn(['xkill']);
        }));
    }
};

let forceQuit;

function enable() {
    forceQuit = new ForceQuit();
    let _children = Main.panel._leftBox.get_children();
    Main.panel._leftBox.insert_actor(forceQuit._button, _children.length - 1);
}

function disable() {
    Main.panel._leftBox.remove_actor(forceQuit._button);
    forceQuit.destroy();
}

function init() {
// do nothing
}