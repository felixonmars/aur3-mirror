# $Id: PKGBUILD 63965 2012-02-08 18:15:06Z pschmitz $

_pkgbasename=libvorbis
pkgname=libx32-$_pkgbasename
pkgver=1.3.3
pkgrel=1.1
pkgdesc="Vorbis codec library (x32 ABI)"
arch=('x86_64')
license=('custom')
url="http://www.xiph.org/ogg/vorbis/"
depends=('libx32-libogg' $_pkgbasename)
makedepends=(gcc-multilib-x32)
options=('!libtool')
source=(http://downloads.xiph.org/releases/vorbis/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('6b1a36f0d72332fae5130688e65efe1f')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  #-march=i686 optimizes too much, strip it out
  CFLAGS=${CFLAGS/-march=$CARCH} ./configure --prefix=/usr --disable-static --libdir=/usr/libx32
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
