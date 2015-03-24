# Maintainer: DeadSurgeon42 <deadsurgeon42 at gmail dot com>
pkgname=cydia-impactor
pkgver=0.9.14
pkgrel=1
pkgdesc="Master Key based universal Android rooting tool for Android versions <4.2"
arch=('i686' 'x86_64')
url="http://www.cydiaimpactor.com/"
license=('unknown')
groups=('system')
depends=('android-udev' 'libudev.so.0')
options=('!strip')
source_i686=("Impactor32.tar.gz::https://cydia.saurik.com/api/latest/4")
source_x86_64=("Impactor64.tar.gz::https://cydia.saurik.com/api/latest/5")
md5sums_i686=('bf22971bbebfd4c8f878ebe7f377a409')
md5sums_x86_64=('50293b68463de3ac1985fa8c0551b537')

pkgver() {
	curl -qI https://cydia.saurik.com/api/latest/5 | grep Location | awk {'print $2'} | sed 's/.*Impactor64_//g' | rev | cut -c 6- | rev
}

package() {
	mkdir -p $pkgdir/opt/cydia/impactor/
	mkdir -p $pkgdir/usr/bin/
	mv Impactor Impactor.so Impactor.dat $pkgdir/opt/cydia/impactor/
	echo "cd /opt/cydia/impactor/ && ./Impactor" > $pkgdir/usr/bin/Impactor
	echo "cd /opt/cydia/impactor/ && ./Impactor" > $pkgdir/usr/bin/impactor
	chmod +x $pkgdir/usr/bin/Impactor $pkgdir/usr/bin/impactor

}
