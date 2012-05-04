# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=gmult
pkgver=8.0
pkgrel=1
pkgdesc="A simple multiplication puzzle game"
arch=('i686' 'x86_64')
url="https://launchpad.net/gmult/"
license=('GPL3')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('intltool')
install="${pkgname}.install"
source=("https://launchpad.net/gmult/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('adbcb38e55a8478d5088cc217f1656c8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr LDFLAGS=-lm
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS NEWS README THANKS "${pkgdir}/usr/share/doc/${pkgname}"
}
