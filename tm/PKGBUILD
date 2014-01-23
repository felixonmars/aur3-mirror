# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=tm
pkgver=0.4.1
pkgrel=2
pkgdesc="Terminal Mixer can start processes inside a pseudo-terminal for collaborative access over network"
url=('http://vicerveza.homeunix.net/~viric/soft/tm')
arch=('i686' 'x86_64')
license=('GPL2')
source=("http://vicerveza.homeunix.net/~viric/soft/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('66e3aca1cb4755329c845519916f62b1')

build () {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make PREFIX="$pkgdir" INSTALL="/bin/install -c" install
}
