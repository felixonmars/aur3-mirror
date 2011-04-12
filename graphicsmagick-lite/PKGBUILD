# Maintainer: osily <ly50247 at gmail dot com>

pkgname=graphicsmagick-lite
_realname=graphicsmagick
pkgver=1.3.12
pkgrel=1
pkgdesc="Image processing system"
arch=('i686' 'x86_64')
url="http://www.graphicsmagick.org/"
license=('MIT')
depends=('bzip2' 'freetype2' 'libsm' 'libtiff' 'libxml2' 'libtool')
options=('!libtool')
provides=(graphicsmagick)
conflicts=(graphicsmagick)
source=(http://downloads.sourceforge.net/sourceforge/${_realname}/${_realname}-history/1.3/GraphicsMagick-${pkgver}.tar.gz)
md5sums=('2cf6e2eea0d7af3019c9a89b81aad624')                                                                                                                                                    

build() {
  cd "${srcdir}/GraphicsMagick-$pkgver"

  ./configure --prefix=/usr --disable-static --disable-largefile --without-magick-plus-plus \
      --without-perl
  make
}

package() {
  cd "${srcdir}/GraphicsMagick-$pkgver"

  make DESTDIR="${pkgdir}" install

  # Install MIT license
  install -Dm644 "Copyright.txt" "${pkgdir}/usr/share/licenses/$_realname/Copyright.txt"

  rm -rf "${pkgdir}/usr/include/"
  rm -rf "${pkgdir}/usr/bin/GraphicsMagick-config"
  rm -rf "${pkgdir}/usr/bin/GraphicsMagickWand-config"
  rm -rf "${pkgdir}/usr/lib/libGraphicsMagick.a"
  rm -rf "${pkgdir}/usr/lib/libGraphicsMagickWand.a"
  rm -rf "${pkgdir}/usr/lib/pkgconfig/"

}
