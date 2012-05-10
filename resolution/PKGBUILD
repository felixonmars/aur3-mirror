# Contributor:	Pablo Lezaeta	<prflr88 @ gmail.com>

pkgname=resolution
_pkgname=Resolution
pkgver=0.3.ml
_pkgver=0.3
pkgrel=1
pkgdesc="Resolution setter for rox desktop, plus manualinux patchs"
group=('rox-desktop')
arch=('any')
url="http://roscidus.com/desktop/Keyboard"
license=('GPL')
depends=('rox-lib' 'gtk2')
source=(http://manualinux.heliohost.org/archivos/rox/$_pkgname-$_pkgver-ML.tar.bz2
	arch.patch)
md5sums=('b931696e08108bf9b017db7ebe570c80'
	'2ead95238de7be3f9408c697d22d19ff')

build() {
	cd "$srcdir/$_pkgname"
	patch -Np1 -i ../arch.patch
	rm -R Help
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -R * "$pkgdir/usr/share/$pkgname"
	cp -R .DirIcon "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	echo "#!/usr/bin/env bash" > $pkgdir/usr/bin/$pkgname
	echo "/usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
	chmod +x $pkgdir/usr/bin/$pkgname
}
