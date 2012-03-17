# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=revolutionary
pkgver=0.4
_pkgver="0.4pre4"
pkgrel=1
pkgdesc="S-OFF & recovery tool for Android smartphones"
arch=('i686' 'x86_64')
url="http://revolutionary.io"
license=('unknown')
source=("http://revolutionary.io/$pkgname-$_pkgver.tgz")
md5sums=('eae9f8205fa48e32af56a5968885a37a')
options=('!strip')
build() {
	cd $srcdir/
	mkdir -p $pkgdir/usr/bin/
	cp $pkgname $pkgdir/usr/bin/$pkgname
}
