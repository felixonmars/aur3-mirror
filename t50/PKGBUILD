# Maintainer: Fabiano Furtado < fusca14 (at) gmail (dot) com >

pkgname=t50
pkgver=5.4.1
pkgrel=1
pkgdesc="Experimental Multi-protocol Packet Injector Tool"
arch=('i686' 'x86_64')
url="http://t50.sourceforge.net/"
license=('GPL2')
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('3db0b93faab51e7be6c47c1abf35ea8a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p ${pkgdir}/usr/bin
  install -D t50 ${pkgdir}/usr/bin/t50
  install -Dm644 doc/t50.1 ${pkgdir}/usr/share/man/man1/t50.1
}
