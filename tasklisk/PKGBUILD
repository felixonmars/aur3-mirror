# Contributor:	Pablo Lezaeta	<prflr88 @ gmail.com>

pkgname=tasklisk
_pkgname=Tasklist
pkgver=0.5.ml
pkgrel=1
pkgdesc="A tasklisk for the rox pinboard"
group=('rox-desktop')
arch=('x86_64' 'i686')
url="http://roscidus.com/desktop/Tasklisk"
license=('GPL')
depends=(libwnck libxml2 gtk2 libx11)
source=(http://manualinux.heliohost.org/archivos/rox/Tasklist-0.5-ML.tar.bz2
	usrmerge.patch)
md5sums=('52f07b975755b242d642712d3e0403dc'
         '4ab8de04fff6ac0c3696e1db1565fde7')

build() {
	cd "$srcdir/$_pkgname"
	patch -Np1 -i ../usrmerge.patch
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
