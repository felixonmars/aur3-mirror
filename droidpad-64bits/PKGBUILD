# Maintainer: Jrandiny
pkgname=droidpad-64bits
pkgver=2.1
pkgrel=1
pkgdesc="Droidpad server for linux"
arch=('x86_64')
url="http://digitalsquid.co.uk/droidpad/"
license=('GPL')
depends=('wxgtk2.8' 'webkitgtk2' 'android-tools' 'android-udev' 'openssl')
source=('https://launchpad.net/~w-shackleton/+archive/ubuntu/droidpad/+files/droidpad_2.1-0~109~ubuntu14.04.1_amd64.deb'
'droidpad-64bits.desktop')
noextract=()
md5sums=('75c437f87e72fee4c73c13981ebf69b6'
'76e5cdedd496cd432df33b174ed374ea')

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
	install -Dm 644 ${pkgname}.desktop	${pkgdir}/usr/share/applications/${pkgname}.desktop
	

}
