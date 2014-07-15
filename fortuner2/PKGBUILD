# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>

pkgname=fortuner2
pkgver=2014.07.1
pkgrel=1
pkgdesc='Shows a fortune as a notification'
arch=('any')
url='https://github.com/jnumm/fortuner2'
license=('GPL3')
depends=('fortune-mod' 'libnotify' 'gettext' 'gtk-update-icon-cache')
makedepends=('desktop-file-utils')
install="${pkgname}.install"
source=("https://github.com/jnumm/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9c07e83d1341476f4f2d3edec5152801579566ec599b1a8d9101c6191f3e208b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr SYSCONFDIR=/etc
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc install

  install -Dm644 README.md doc/fortuner2.conf.ex \
      "${pkgdir}/usr/share/doc/${pkgname}/"
}
