# Maintainer: z3bra <willy at mailoo dot org>
pkgname=xantfarm
pkgver=23oct1991
pkgrel=1
pkgdesc='Xantfarm simulates an ant hill and displays it in the root window.'
arch=('i686' 'x86_64')
url='http://www.acme.com/software/xantfarm'
license=('ACME Labs Freeware License')
depends=('libx11')
makedepends=('imake')
provides=('xantfarm')
source=('http://acme.com/software/xantfarm/xantfarm_'${pkgver}'.tar.gz')
md5sums=( 'd3a7a4366baad292fcb6c05df59a0ee0' )

build() {
  cd "$pkgname"
  xmkmf
  make depend
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install.man
}

# vim:set ts=2 sts=2 sw=2 et:

