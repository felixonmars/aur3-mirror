// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);

// Don't show close buttons on tabs
pref("browser.tabs.closeButtons", 2);

// Always show the full URL
pref("browser.urlbar.trimURLs", false);

// Disable spellchecking by default
pref("layout.spellcheckDefault", 0);
