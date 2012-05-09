# Contributor:	Pablo Lezaeta	<prflr88 @ gmail.com>

pkgname=rox-keyboard
_pkgname=Keyboard
pkgver=0.11.1.ml
_pkgver=0.11.1
pkgrel=1
pkgdesc="Keyboard setter for rox desktop, with manualinux patchs"
group=('rox-desktop')
arch=('any')
url="http://roscidus.com/desktop/Keyboard"
license=('GPL')
depends=('rox-lib')
source=(http://manualinux.heliohost.org/archivos/rox/$_pkgname-$_pkgver-ML.tar.bz2
	arch_specific.patch)
md5sums=('625a27e5343a43cd308b217b7a264ba7'
	'9ae515d4a454894958153a053f4b1020')

build() {
	cd "$srcdir/$_pkgname"
	patch -Np1 -i ../arch_specific.patch
	rm -R Help
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -R * "$pkgdir/usr/share/$pkgname"
	cp -R .DirIcon "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	echo "#!/usr/bin/env bash" > $pkgdir/usr/bin/$pkgname
	echo "/usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
	chmod +x $pkgdir/usr/bin/$pkgname
}
