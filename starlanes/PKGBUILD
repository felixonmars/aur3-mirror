# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=starlanes
pkgver=1.3.0
pkgrel=1
pkgdesc="A classic text-only space-age stock trading game"
arch=('i686' 'x86_64')
url="http://www.barnsdle.demon.co.uk/game/starlanes.html"
license=('GPL')
depends=('ncurses')
source=("http://www.barnsdle.demon.co.uk/game/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch")
md5sums=('0a94ad2e41697e772864859f2eed7deb'
         '7e9a1cdd44475b9f2249e0e1c6dbcbc8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../${pkgname}.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install a binary
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README changelog "${pkgdir}/usr/share/doc/${pkgname}"

  # Install a man page
  install -Dm644 ${pkgname}.6 "${pkgdir}/usr/share/man/man6/${pkgname}.6"
}
