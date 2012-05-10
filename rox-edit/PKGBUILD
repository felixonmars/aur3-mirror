# Contributor:	Pablo Lezaeta	<prflr88 @ gmail.com>

pkgname=rox-edit
_pkgname=edit
_pkgnamealt=Edit
pkgver=2.2
pkgrel=1
pkgdesc="Text editor for rox resemble the Risc OS text editor"
group=('rox-desktop')
arch=('any')
url="http://roscidus.com/desktop/Editor"
license=('GPL')
depends=('rox-lib' 'gtk2')
source=(http://downloads.sourceforge.net/project/rox/Edit/2.2/$_pkgname-2.2.tar.bz2
	arch.patch)
md5sums=('3c006b6833dc8e7328de40660ec6c800'
	'980e3a2f34516a7332f36a535e8d8dce')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	patch -Np1 -i ../arch.patch
	mv $srcdir/$_pkgname-$pkgver/$_pkgnamealt $srcdir/$_pkgname 
	cd $srcdir/$_pkgname
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -R * "$pkgdir/usr/share/$pkgname"
	cp -R .DirIcon "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	echo "#!/usr/bin/env bash" > $pkgdir/usr/bin/$pkgname
	echo "/usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
	chmod +x $pkgdir/usr/bin/$pkgname
}
