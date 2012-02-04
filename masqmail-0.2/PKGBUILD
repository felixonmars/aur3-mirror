# Contributor: Matthias Matousek <matou@taunusstein.net>
pkgname="masqmail-0.2"
pkgver=0.2.28
pkgrel=3
pkgdesc="An MTA for workstations and for servers in small networks."
arch=(x86_64)
url="http://marmaro.de/prog/masqmail/"
license=('GPL2')
depends=('glib')
makedepends=('make')
replaces=('masqmail')
conflicts=('masqmail')
install=('config.install')
source=(${url}files/masqmail-${pkgver}.tar.gz)
md5sums=('04ba5e62b8b3e44644b58c0ae7135d52')

build() {
  cd "${srcdir}/masqmail-${pkgver}"

  ./configure --prefix=/usr --enable-ident --enable-auth --with-user=mail --with-group=mail
  make
}

package() {
  cd "${srcdir}/masqmail-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
