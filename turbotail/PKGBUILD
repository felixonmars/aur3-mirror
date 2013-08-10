# Maintainer: 
# Contributor: Henrik Nymann Jensen 

pkgname=turbotail
pkgver=0.3
pkgrel=3
pkgdesc="A drop-in replacement for the original (GNU-)tail program"
arch=('i686' 'x86_64')
url="http://www.vanheusden.com/turbotail"
license=('GPL')
depends=('gamin')
source=($url/$pkgname-$pkgver.tgz)
md5sums=('a4eecdd0cae9552f17cb1c540a08f6f2')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -Dm755 turbotail "$pkgdir"/usr/bin/turbotail
}
