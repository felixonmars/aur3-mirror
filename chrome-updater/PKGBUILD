# Maintainer: Christof Schlögl <i.like.webm@gmail.com>
 
pkgname="chrome-updater"
pkgdesc="Google Chrome with auto updates : Drop the Google Chrome [auto-updatet] out of the Launcher in you're Panel/Dock and enjoy using Chrome WITH auto Updates"
pkgver="1.0"
depends=('polkit' 'curl' 'wget' 'google-chrome' 'pacman')
pkgrel=1
url="https://github.com/check/chrome-updater"
arch=('i686', 'x86_64')
source=('google-chrome-auto.desktop'
		'chrome.sh'
		'json.sh'
		'update_chrome.sh')
md5sums=('7eaacbca939bb237f0fabc58c6474bc2'
	     '18cf0f3baf5d775558650aee8c17627e'
	     'e92eb9843e08cd2ecf949a09f83de66b'
	     'df2aaef73701960436b5165d81bb95b6')
license=('MIT')

package_chrome-updater() {
	mkdir -p $pkgdir/usr/share/applications; mkdir -p $pkgdir/usr/share/chrome-update;
	cp -p $srcdir/google-chrome-auto.desktop $pkgdir/usr/share/applications;
	cp -p $srcdir/*.sh $pkgdir/usr/share/chrome-update; 
	chmod +x $pkgdir/usr/share/chrome-update/chrome.sh; 
}
