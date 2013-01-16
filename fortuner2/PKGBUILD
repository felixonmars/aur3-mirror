# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>

pkgname=fortuner2
pkgver=0.4.0
pkgrel=1
pkgdesc="Shows a fortune as a notification"
arch=('any')
url="https://github.com/jnumm/fortuner2"
license=('GPL3')
depends=('fortune-mod' 'libnotify' 'notification-daemon' 'gettext'
         'desktop-file-utils' 'hicolor-icon-theme')
install=$pkgname.install
source=(https://github.com/jnumm/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('a5e83b912c18ff1e5caac39926fbd3f6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr SYSCONFDIR=/etc
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr SYSCONFDIR=/etc install
}
