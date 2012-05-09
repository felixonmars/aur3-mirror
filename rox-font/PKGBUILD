# Contributor:	Pablo Lezaeta	<prflr88 @ gmail.com>

pkgname=rox-font
_pkgname=Font
pkgver=0.9.2.ml
_pkgver=0.9.2
pkgrel=2
pkgdesc="Font setter for rox desktop, with manualinux patchs"
group=('rox-desktop')
arch=('any')
url="http://roscidus.com/desktop/Font"
license=('GPL')
depends=('rox-lib')
source=(http://manualinux.heliohost.org/archivos/rox/$_pkgname-$_pkgver-ML.tar.bz2
	arch_specific.patch)
md5sums=('2e77962fe8f43a89ed754fd76fc84206'
	'ab19159e965edcc21be320f6934685ad')

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
