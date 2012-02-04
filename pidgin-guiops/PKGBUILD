# Maintainer: János Illés <ijanos@gmail.com>
pkgname=pidgin-guiops
pkgver=0.5.1
pkgrel=1
pkgdesc="Provides more GUI customization options for pidgin"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pidgin-guiops/"
license=('GPL3')
depends=(pidgin)
source=(http://pidgin-guiops.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('63b6ef252ceb7e2ac3f39eca888ed390')

build() {
  cd "$srcdir/$pkgname"

  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
