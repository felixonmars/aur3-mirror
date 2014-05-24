// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);

// Disable Social API
pref("social.remote-install.enabled", false);

// Make sure that safebrowsing is disabled
pref("browser.safebrowsing.enabled", false);
pref("browser.safebrowsing.malware.enabled", false);

// Disable localstorage for privacy reasons.
pref("dom.storage.enabled", false);

// Disable missing nonfree flash notification
pref("plugins.notifyMissingFlash", false);

// Disable "alt" as a shortcut key to open full menu bar. Conflicts with "alt" as a modifier
pref("ui.key.menuAccessKeyFocuses", false);
