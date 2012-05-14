# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Krzysztof Wloch <wloszekk@gmail.com>
# Contributor: demonicmaniac <stormtrooperofdeath@gmx.net>

pkgname=ckmame
pkgver=0.11
pkgrel=1
pkgdesc="A program to check ROM sets for MAME"
arch=('i686' 'x86_64')
url="http://www.nih.at/ckmame/"
license=('custom')
depends=('libxml2' 'libzip' 'sqlite3')
source=("http://www.nih.at/ckmame/${pkgname}-${pkgver}.tar.bz2")
md5sums=('e41e8f81d5051eb074137f8a41f9e007')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install a license file
  sed -n "3,31p" src/ckmame.c > COPYING
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
