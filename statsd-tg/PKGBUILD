# Maintainer: Hermann Mayer <hermann.mayer92@gmail.com>
pkgname=statsd-tg
pkgver=1.0.1
pkgrel=2
pkgdesc="A traffic generator for StatsD."
url="https://github.com/octo/statsd-tg"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('glibc')
optdepends=()
makedepends=('autoconf' 'make')
conflicts=()
replaces=()
backup=()
install=''
source=("https://github.com/octo/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('6d0d39959dc91088a38a7491a73ca8d2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoscan
  aclocal
  autoheader
  autoconf
  automake
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
