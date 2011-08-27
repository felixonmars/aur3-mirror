# Maintainer: TryA <tryagainprod {at} gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Piotr Krawiec (aka pkraw)

pkgname=libxft-lcd
pkgver=2.2.0
pkgrel=1
pkgdesc="FreeType-based font drawing library for X (with custom LCD filter)"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('GPL')
depends=('fontconfig' 'libxrender')
makedepends=('pkgconfig')
options=('!libtool')
conflicts=('libxft')
provides=("libxft=$pkgver")
source=(${url}/releases/individual/lib/libXft-${pkgver}.tar.bz2 \
        xorg-lib-libXft-lcd-filter.patch)
md5sums=('cce3c327258116493b753f157e0360c7'
         '15375a2ef718cb5f89701639c9b23982')

build() {
  cd ${srcdir}/libXft-${pkgver}

  patch -Np1 -i ${srcdir}/xorg-lib-libXft-lcd-filter.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make
}

package() {
  cd ${srcdir}/libXft-${pkgver}
  make DESTDIR=${pkgdir} install
}
