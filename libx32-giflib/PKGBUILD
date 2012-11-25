# Upstream Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=giflib
pkgname=libx32-$_pkgbasename
pkgver=4.1.6
pkgrel=7.1
pkgdesc="A library for reading and writing gif images (x32 ABI)"
url="http://sourceforge.net/projects/giflib/"
arch=('x86_64')
license=('MIT')
depends=('libx32-libx11' 'libx32-libsm' $_pkgbasename)
makedepends=(gcc-multilib-x32)
provides=("libx32-libungif=${pkgver}")
conflicts=('libx32-libungif')
replaces=('libx32-libungif')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/giflib/${_pkgbasename}-${pkgver}.tar.bz2)
md5sums=('7125644155ae6ad33dbc9fc15a14735f')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${srcdir}/${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/libx32
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  make DESTDIR=${pkgdir} install

  # libungif compatibility - instructions taken from Redhat specfile
  MAJOR=`echo ${pkgver} | sed 's/\([0-9]\+\)\..*/\1/'`
  gcc -mx32 -shared -Wl,-soname,libungif.so.${MAJOR} -Llib/.libs -lgif -o libungif.so.${pkgver}
  install -m755 libungif.so.${pkgver} ${pkgdir}/usr/libx32/
  ln -sf libungif.so.${pkgver} ${pkgdir}/usr/libx32/libungif.so.4
  ln -sf libungif.so.4 ${pkgdir}/usr/libx32/libungif.so

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  install -m755 -d ${pkgdir}/usr/share/licenses
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
