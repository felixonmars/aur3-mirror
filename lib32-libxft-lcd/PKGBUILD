# Maintainer: TryA <tryagainprod {at} gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Piotr Krawiec (aka pkraw)

pkgname=lib32-libxft-lcd
pkgver=2.2.0
pkgrel=1
pkgdesc="FreeType-based font drawing library for X (with custom LCD filter, 32-bit)"
url="http://xorg.freedesktop.org/"
arch=('x86_64')
license=('GPL')
depends=('lib32-fontconfig' 'lib32-libxrender')
makedepends=('gcc-multilib')
conflicts=('lib32-libxft' 'lib32-libxft-ubuntu')
provides=("lib32-libxft=$pkgver")
options=('!libtool')
source=(${url}/releases/individual/lib/libXft-${pkgver}.tar.bz2 \
        xorg-lib-libXft-lcd-filter.patch)
md5sums=('cce3c327258116493b753f157e0360c7'
         '15375a2ef718cb5f89701639c9b23982')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${srcdir}/libXft-${pkgver}

  patch -Np1 -i ${srcdir}/xorg-lib-libXft-lcd-filter.patch
  ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make
}

package() {
  cd ${srcdir}/libXft-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/{bin,include,share}
}
