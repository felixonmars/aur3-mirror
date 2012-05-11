# Contributor:	Pablo Lezaeta	<prflr88 @ gmail.com>

pkgname=mini-clock
_pkgname=MiniClock
pkgver=2.0.0.ml
_pkgver=2.0.0
pkgrel=2
pkgdesc="Mini clock applet for rox pinboard"
group=('rox-desktop')
arch=('any')
url="http://manualinux.heliohost.org/rox02.html"
license=('GPL')
depends=('rox-lib' 'python2' 'gtk2')
source=(http://manualinux.heliohost.org/archivos/rox/$_pkgname-$_pkgver-ML.tar.bz2
	arch.patch)
md5sums=('034888afcdd742f2494661f086c5d678'
	'cb1ed5ed7857c4a90e6c6aa2fa566e23')

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
