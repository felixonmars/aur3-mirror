# Contributor:	Pablo Lezaeta	<prflr88 @ gmail.com>

pkgname=systemtray-n
_pkgname=SystemTrayN
pkgver=0.3.2.1.ml
pkgrel=3
pkgdesc="A system tray for the rox pinboard"
group=('rox-desktop')
arch=('x86_64' 'i686')
url="http://roscidus.com/desktop/node/214"
license=('GPL')
depends=(libwnck libxml2 gtk2 libx11 rox-cLib)
source=(http://manualinux.heliohost.org/archivos/rox/SystemTrayN-0.3.2-1-ML.tar.bz2)
#	usrmerge.patch)
md5sums=('356b7cacd6caea12654d0ecadaccf12a')
#         '4ab8de04fff6ac0c3696e1db1565fde7')

build() {
	cd "$srcdir/$_pkgname"
#	patch -Np1 -i ../usrmerge.patch
	./AppRun --compile
}
package () {
	cd $srcdir/$_pkgname
	mkdir -p $pkgdir/usr/share/$_pkgname
	cp -R $srcdir/$_pkgname $pkgdir/usr/share/
	cp -R .DirIcon $pkgdir/usr/share/$_pkgname
	mkdir -p $pkgdir/usr/bin
	echo "#!/usr/bin/env bash" > $pkgdir/usr/bin/$pkgname
	echo "/usr/share/$_pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
	chmod +x $pkgdir/usr/bin/$pkgname
}
