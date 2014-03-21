# Maintainer: Bob Pirkle <bobhenrypirkle@gmail.com>
pkgname=crover
pkgver=1.0
pkgrel=2
pkgdesc="generates an age-based version number for Arch Linux"
url="http://code.google.com/p/crover/"
license=('GPL')
arch=('any')
depends=()
source=(http://crover.googlecode.com/git/tarballs/crover-1.0.tar.gz)

package() {
cd ${srcdir}/${pkgname}-${pkgver}
make DESTDIR="$pkgdir/" install
}

md5sums=('4c7cd24168f515066c4c6ffd4c0db68a')
