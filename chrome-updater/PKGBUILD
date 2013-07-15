# Creator: Christof Schlögl <i.like.webm@gmail.com>
# Maintainer: Justin Sabelko <jbirdjavi@gmail.com>
 
pkgname="chrome-updater"
pkgdesc="Google Chrome with auto updates : Drop the Google Chrome [auto-updater] out of the Launcher in you're Panel/Dock and enjoy using Chrome WITH auto Updates"
pkgver="1.1"
pkgrel=3
depends=('polkit' 'curl' 'wget' 'google-chrome' 'pacman')
url="https://github.com/jbirdjavi/chrome-updater"
arch=('i686', 'x86_64')
source=('google-chrome-auto.desktop'
		'chrome.sh'
		'json.sh'
		'update_chrome.sh')
md5sums=('7eaacbca939bb237f0fabc58c6474bc2'
	     '59711398faf1a8fabc79cb6a3682d090'
	     'e92eb9843e08cd2ecf949a09f83de66b'
	     '0aa3c63c830d604a28b6342cfb5285e2')
license=('MIT')

package_chrome-updater() {
	mkdir -p $pkgdir/usr/share/applications; mkdir -p $pkgdir/usr/share/chrome-update;
	cp -p $srcdir/google-chrome-auto.desktop $pkgdir/usr/share/applications;
	cp -p $srcdir/*.sh $pkgdir/usr/share/chrome-update; 
	chmod +x $pkgdir/usr/share/chrome-update/chrome.sh; 
}
