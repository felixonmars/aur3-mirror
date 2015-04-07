# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=gumbo-parser
pkgver=0.9.3
pkgrel=1
pkgdesc='A pure-C HTML5 parser'
url='https://github.com/google/gumbo-parser'
license=('Apache')
source=('https://github.com/google/gumbo-parser/archive/v0.9.3.tar.gz')
md5sums=('c11196e76d0d8e1deff835ccf59eeba5')
sha1sums=('bb7a85a0ac622326b151ce178fce27dcdf10031e')
sha256sums=('038354c0394591b270eafc9203aef4516afbf78a66fcb2c4fff5180593b003f0')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git')
provides=('gumbo-parser')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  chmod +x autogen.sh
  ./autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
