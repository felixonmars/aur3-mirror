# Maintainer: mar77i <mysatyre at gmail dot com>

pkgname=pidgin-gtalk-shared-status
pkgver=0.1.4
pkgrel=1
pkgdesc="Adds Google Shared Status compatibility."
url="http://www.siorarina.net/gtalk-shared-status/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('pidgin')
makedepends=('libpurple')
replaces=('pidgin-gtalkinvisible')
source=("http://www.siorarina.net/gss/src/${pkgname#*-}-$pkgver.src.tar.gz")
md5sums=('a2d2a512e83c73ea5bfd3ea1ddc3b64d')

build() {
  cd "${srcdir}/${pkgname#*-}-$pkgver"
  sed -i 's@-p ~/\.purple/plugins@-p $(prefix)@' Makefile
  make "prefix=${pkgdir}/lib/purple"
}

package() {
  cd "${srcdir}/${pkgname#*-}-$pkgver"
  make "prefix=${pkgdir}/lib/purple" install
}