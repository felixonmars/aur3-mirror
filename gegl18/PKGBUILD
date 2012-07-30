# $Id: 
# Maintainer: David C. Rankin <drankinatty at gmail dot com>

pkgname=gegl18
pkgver=0.1.8
pkgrel=3
pkgdesc="Graph based image processing framework"
arch=('i686' 'x86_64')
url="http://www.gegl.org/"
license=('GPL3' 'LGPL3')
depends=('babl' 'gtk2')
makedepends=('ruby' 'lua' 'openexr' 'ffmpeg' 'librsvg' 'jasper' 'exiv2')
optdepends=('openexr: for using the openexr plugin' \
            'ffmpeg: for using the ffmpeg plugin' \
            'librsvg: for using the svg plugin' \
            'jasper: for using the jasper plugin')
options=('!libtool')
source=(ftp://ftp.gimp.org/pub/${pkgname//18}/${pkgver%.*}/${pkgname//18}-${pkgver}.tar.bz2)
sha1sums=('3d4d902580f5c5122b01b5188b6b5da03089ecac')

build() {
  cd "${srcdir}/${pkgname//18}-${pkgver}"
  ./configure  --prefix=/usr  --with-sdl --with-openexr --with-librsvg \
    --with-libavformat --with-jasper --disable-docs
  make
}

#check() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#  make check
#}

package() {
  cd "${srcdir}/${pkgname//18}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
