# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Upstream Maintainer: JD Steffen <jd@steffennet.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=smpeg
pkgname=libx32-${_pkgbasename}
pkgver=0.4.4
pkgrel=9.1
pkgdesc="SDL MPEG Player Library (x32 ABI)"
arch=('x86_64')
url="http://icculus.org/smpeg/"
license=('LGPL')
depends=('libx32-sdl' 'libx32-gcc-libs' "${_pkgbasename}=${pkgver}")
makedepends=('gcc-multilib-x32' 'libx32-mesa')
optdepends=('libx32-mesa')
options=('!libtool' '!makeflags')
source=(http://mirrors.dotsrc.org/lokigames/open-source/smpeg/${_pkgbasename}-${pkgver}.tar.gz smpeg-0.4.4-gcc41.patch)
md5sums=('59c76ac704088ef5539210190c4e1fe3' '8b979a58307d7196655758bd3d2466c4')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  patch -p1 < ../smpeg-0.4.4-gcc41.patch

  export CC='gcc -mx32'
  export CXX="g++ -mx32"
  export LIBS=-L/usr/libx32
  export PKG_CONFIG_PATH=/usr/libx32/pkgconfig
  ./configure --prefix=/usr --libdir=/usr/libx32
  make LDFLAGS+=-lstdc++
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make DESTDIR=${pkgdir} install
 
  #fix aclocal warnings
  sed -i "s#(AM_PATH_SMPEG#([AM_PATH_SMPEG]#" ${pkgdir}/usr/share/aclocal/smpeg.m4
  
  rm -rf "${pkgdir}"/usr/{bin,include,share,man,info}
}


