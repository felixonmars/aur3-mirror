# Maintainer: Anonymo <meowdib at gmail dot com>
# Maintainer: Luca Bennati <lucak3 at gmail dot com>

pkgname=freetype2-lcd_
_realname=freetype
pkgver=2.4.9
pkgrel=2
pkgdesc="TrueType font rendering library for LCD Displays"
arch=('i686' 'x86_64')
license=('GPL')
url="http://freetype.sourceforge.net"
depends=('zlib' 'cairo>=1.10.0' 'libxft')
provides=("freetype2=${pkgver}")
conflicts=('freetype2' 'freetype2-lcd')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/${_realname}/${_realname}-$pkgver.tar.bz2"
	freetype-2-quantization_fix.patch
	ftoption.h)
md5sums=('77a893dae81fd5b896632715ca041179'
         '385162f4a3e01653d55ab9a9be0c8808'
         '5a8171040609dc6f67048e955b5b1324')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"

  cp ../../ftoption.h include/freetype/config/ftoption.h
  cp ../../freetype-2-quantization_fix.patch src/autofit/freetype-2-quantization_fix.patch
  cd src/autofit
  patch -p0 -i freetype-2-quantization_fix.patch
  cd ../../

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
