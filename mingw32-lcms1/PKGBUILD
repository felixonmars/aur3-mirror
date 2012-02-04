# Maintainer: Schala <schalaalexiazeal@gmail.com>

pkgbase=lcms
pkgname=mingw32-lcms1
pkgver=1.19
pkgrel=1
pkgdesc="Lightweight color management development library/engine (mingw32)"
arch=('any')
depends=('mingw32-runtime' 'mingw32-libtiff')
makedepends=('mingw32-gcc')
options=('!libtool' '!strip')
conflicts=('mingw32-lcms')
license=('custom')
url="http://www.littlecms.com"
source=(http://downloads.sourceforge.net/sourceforge/${pkgbase}/${pkgbase}-${pkgver}.tar.gz)
md5sums=('8af94611baf20d9646c7c2c285859818')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  export CFLAGS="-O2 -mms-bitfields"
  export PKG_CONFIG_PATH="/usr/i486-mingw32/lib/pkgconfig/"
  unset LDFLAGS # mingw-ld chokes on --hash-style=gnu

  ./configure \
      --prefix=/usr/i486-mingw32 \
      --host=i486-mingw32 \
      --build=$CHOST

    make
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
