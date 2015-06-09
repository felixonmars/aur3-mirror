# Maintainer: Hardy Jones <jones3 dot hardy at gmail dot com>
pkgname=idris-bin
pkgver=0.9.18.1
pkgrel=2
pkgdesc="A Dependently Typed Functional Programming Language."
arch=('x86_64')
url="http://idris-lang.org/"
license=('custom:"BSD3"')
depends=('glibc' 'gmp' 'libffi' 'ncurses' 'zlib')
provides=('idris')
source=("https://github.com/joneshf/Idris-dev/releases/download/v$pkgver/idris.tar.gz")
sha512sums=('3861a9ad9aee33539a261810b71fd47548ee194e0c6efa3608389b8443b445b1edf822143fcc53230db9d67e35bde1e86cf91f90b687652e5af92caebf5afbfc')

package() {
  cd "${srcdir}"

  install -D -m755 idris "${pkgdir}/usr/bin/idris"
  install -D -m755 idris-c "${pkgdir}/usr/bin/idris-c"
  install -D -m755 idris-javascript "${pkgdir}/usr/bin/idris-javascript"
  install -D -m755 idris-node "${pkgdir}/usr/bin/idris-node"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
