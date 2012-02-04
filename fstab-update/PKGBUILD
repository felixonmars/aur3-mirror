# Contributor: T - rttommy@gmail.com
pkgname=fstab-update
pkgver=0.2
pkgrel=1
pkgdesc="A simple automounter/demounter for Linux"
url="http://code.google.com/p/fstab-update/"
depends=()
makedepends=()
arch=('i686' 'x86_64')
license=('GPL2')
source=(http://fstab-update.googlecode.com/files/fstab-update-$pkgver.tar.bz2)
md5sums=('8b669c873b2a6d18078f61bbb6126121')
build() {
	cd "$startdir/src"
	./install "$startdir/pkg"
}
