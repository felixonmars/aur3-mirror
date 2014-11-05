# Maintainer: Camille <onodera@rizon>

pkgname=human-git
pkgver=v0.1.r2.g40b4dac
pkgrel=1
pkgdesc="make a number human-readable"
url="http://git.z3bra.org/cgit.cgi/human"
arch=('i686' 'x86_64')
license=('WTFPL')
depends=()
source=("$pkgname::git+git://z3bra.org/human")
sha1sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

