# Maintainer: Tristan Webb <tristanjwebb@gmail.com>

pkgname=freeciv-beta
_pkgname=freeciv
pkgver=2.3.0_RC2
_pkgver=2.3.0-RC2
pkgrel=1
pkgdesc="A multiuser clone of the famous Microprose game of Civilization - Beta version"
arch=('i686' 'x86_64')
url="http://www.freeciv.org/"
license=('GPL')
depends=('gtk2' 'sdl_mixer' 'readline' 'bzip2')
options=('!libtool')
replaces=('freeciv')
install=freeciv.install
source=(http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${_pkgver}.tar.bz2)
md5sums=('e38587031881362fb0eeb0844abfab0e')
sha1sums=('1cdf08f65c3150519a919b8f0f8502eaa762c016')



build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  ./configure --prefix=/usr --enable-client=gtk --enable-shared
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}
