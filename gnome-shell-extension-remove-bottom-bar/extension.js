/* -*- mode: js2; js2-basic-offset: 4; indent-tabs-mode: nil -*- */

/* 
 * Gnome-shell extension specific routines.
 *
 * register/unregister keybinding handlers, etc.
 */

const Main = imports.ui.main;
const MessageTray = imports.ui.messageTray;

let origShowTray;

function init() {
origShowTray = MessageTray.MessageTray.prototype._showTray;
}

function enable() {
MessageTray.MessageTray.prototype._showTray = "";
}

function disable() {
MessageTray.MessageTray.prototype._showTray = origShowTray;
}
