# Maintainer: Futuro <evan@cs.umn.edu>
# Upstream Maintainer: Stelian Ionescu <sionescu@cddr.org>
pkgname=libfixposix
pkgver=0.3.0
pkgrel=1
pkgdesc='Thin wrapper over POSIX syscalls'
arch=('i686' 'x86_64')
url='http://common-lisp.net/project/iolib/'
license='Boost-1.0'
depends=('glibc')
makedepends=()
checkdepends=('check')
options=('!libtool')
source=("https://github.com/sionescu/libfixposix/archive/v${pkgver}.tar.gz")
sha256sums=('9fda592842c28b3beb2707b908b2bdca1982c0a37572fad5cfce2ab1ba07f6d3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i -f
  ./configure --prefix=/usr --enable-static --with-pic
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: sw=2 tw=2 et
