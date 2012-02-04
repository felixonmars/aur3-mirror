# Maintainer: osily <ly50247 at gmail dot com>

pkgname=geeqie-lite
_realname=geeqie
pkgver=1.0
pkgrel=1
pkgdesc="A lightweight image browser and viewer (fork of GQview), does not depend on lcms or exiv2."
arch=('i686' 'x86_64')
url="http://geeqie.sourceforge.net/"
license=('GPL3')
depends=('gtk2')
makedepends=('intltool')
optdepends=('librsvg: SVG rendering')
provides=(geeqie)
source=(http://downloads.sourceforge.net/${_realname}/${_realname}-${pkgver}.tar.gz)
md5sums=('1d67ef990390224c5052697d93bb49c0')
sha1sums=('8494a557d67d20e6ad720645ec789dd2b33a3266')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  CPPFLAGS="-D_FILE_OFFSET_BITS=64" ./configure --prefix=/usr --disable-lcms --disable-exiv2 --disable-debug-log
  make
}

package(){
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
