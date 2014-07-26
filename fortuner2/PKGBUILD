# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>

pkgname=fortuner2
pkgver=2014.07.2
pkgrel=1
pkgdesc='Shows a fortune as a notification'
arch=('any')
url='https://github.com/jnumm/fortuner2'
license=('GPL3')
depends=('fortune-mod' 'libnotify' 'gettext' 'gtk-update-icon-cache')
makedepends=('desktop-file-utils')
install="${pkgname}.install"
source=("https://github.com/jnumm/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('379719a839cd262714509e0a01bfd93d9f84fe2857046d99119a3e32a765f30b')

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
