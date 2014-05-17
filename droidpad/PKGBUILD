# Maintainer: Jrandiny
pkgname=droidpad
pkgver=2.1
pkgrel=3
pkgdesc="Droidpad server for linux"
arch=('i686')
url="http://digitalsquid.co.uk/droidpad/"
license=('GPL')
depends=('wxgtk2.8' 'webkitgtk2' 'android-tools' 'android-udev' 'openssl')
source=('https://launchpadlibrarian.net/173454398/droidpad_2.1-0~109~ubuntu14.04.1_i386.deb')
noextract=()
md5sums=('180DBEDAF1876D88C0F6C1DAFB36BE9F')

prepare() {
	cd "$srcdir"
	echo "extracting"
	bsdtar -xf data.tar.xz 
	
}

package() {
	cp -r "$srcdir/usr" "$pkgdir"
	rm "$pkgdir/usr/share/doc/droidpad/changelog.Debian.gz"
	rm "$pkgdir/usr/share/droidpad/adb/adb"
	ln -s /usr/bin/adb "$pkgdir/usr/share/droidpad/adb/adb"
	

}
