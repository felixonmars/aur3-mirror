// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Disable auto-update
pref("app.update.enabled", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);

// Other custom settings
pref("browser.display.use_system_colors", true);
pref("general.smoothScroll", true);
pref("accessibility.typeaheadfind.soundURL", none);
pref("browser.download.manager.scanWhenDone", false);
pref("browser.showQuitWarning", true);
