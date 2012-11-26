# Maintainer: Eric Bélanger <eric@archlinux.org>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=sagasu
pkgver=2.0.12
pkgrel=1
pkgdesc="GNOME tool to find strings in multiple files"
arch=('i686' 'x86_64')
url="http://perso.b2b2c.ca/sarrazip/dev/sagasu.html"
license=('GPL')
depends=('libgnomeui')
source=(http://sarrazip.com/dev/${pkgname}-${pkgver}.tar.gz)
sha1sums=('f47df2d60df8f279a9e4b249075e33464a7da1f5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i -e 's|glib/gmem.h|glib.h|' -e 's|glib/gconvert.h|glib.h|' src/util.h
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
