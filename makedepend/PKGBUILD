# Author: Andrew Boktor <andrew.boktor@gmail.com>

pkgname=makedepend
pkgver=1.0.5
pkgrel=2
pkgdesc="The makedepend package contains a C-preprocessor like utility to determine build-time dependencies."
arch=('i686' 'x86_64')
url="http://freedesktop.org"
license=('GPL2')
depends=('glibc')
source=(http://xorg.freedesktop.org/archive/individual/util/$pkgname-$pkgver.tar.bz2)
md5sums=('0475638eb40a3920d0d3f14482c924a4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix="$pkgdir/usr"
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make install
}
