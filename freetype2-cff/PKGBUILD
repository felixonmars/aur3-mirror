# Maintainer: Barry Shilliday <wotan123 at googlemail dot com> 

pkgname=freetype2-cff
pkgver=2.4.12
pkgrel=4
pkgdesc="TrueType font rendering library with Adobe CFF rasterizer"
arch=(i686 x86_64)
license=('GPL')
url="http://freetype.sourceforge.net"
depends=('zlib' 'bzip2' 'sh')
provides=("freetype2=$pkgver" libfreetype.so)
conflicts=('freetype2')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2
        freetype-2.3.0-enable-spr.patch
        freetype-2.2.1-enable-valid.patch
	enable-cff-git.patch)
md5sums=('3463102764315eb86c0d3c2e1f3ffb7d'
         '816dc8619a6904a7385769433c0a8653'
         '214119610444c9b02766ccee5e220680'
	 '2a471b4c91701b15eec38028bd0aa446')

build() {
  cd "${srcdir}/freetype-${pkgver}"
  patch -Np1 -i "${srcdir}/freetype-2.3.0-enable-spr.patch"
  patch -Np1 -i "${srcdir}/freetype-2.2.1-enable-valid.patch"
  patch -Np1 -i "${srcdir}/enable-cff-git.patch"

  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/freetype-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/freetype-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
