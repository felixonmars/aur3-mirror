# Contributor: Pablo Lezaeta <prflr88 @ gmail.com>

pkgname=rox-trash
_pkgname=Trash
pkgver=0.3.0.ml
pkgrel=2
group=('rox-desktop')
pkgdesc="Trash app for Rox, with manualinux patchs"
arch=('any')
url="http://roscidus.com/desktop/node/287"
license=('GPL')
depends=(rox-lib)
source=(http://manualinux.heliohost.org/archivos/rox/$_pkgname-0.3.0-ML.tar.bz2
	usr_merge.patch
	python2.patch)

build() {
	cd "$srcdir/$_pkgname"
	patch -Np1 -i ../python2.patch
	patch -Np1 -i ../usr_merge.patch
	mkdir -p "$pkgdir/usr/share/$_pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp -R * "$pkgdir/usr/share/$_pkgname"
	cp .DirIcon "$pkgdir/usr/share/$_pkgname"
	cd "$pkgdir/usr/share/$_pkgname"
	echo "#!/usr/bin/env bash" > $pkgdir/usr/bin/$pkgname
	echo "sh /usr/share/$_pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
	chmod +x $pkgdir/usr/bin/$pkgname
}

md5sums=('114f0982eeed4fa33c5fbaa1dee8123c'
	'e5264ea90ccb106d3212d245e485c216'
	'e9e1f3cff5c9e7ef493f8c9f267a1953')
