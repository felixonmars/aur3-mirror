# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: TryA <tryagainprod {at} gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
# Contributor: Mihai Coman <mihai@m1x.ro>

_pkgbasename=elfutils
pkgname=lib32-elfutils
pkgver=0.155
pkgrel=1
pkgdesc="Collection of libraries for working with ELF object files and DWARF debugging information (32-bit)"
arch=('x86_64')
url="https://fedorahosted.org/elfutils/"
license=('GPL2')
depends=('lib32-bzip2' 'lib32-zlib')
makedepends=('gcc-multilib')
provides=('lib32-libelf')
replaces=('lib32-libelf')
conflicts=('lib32-libelf')
source=(https://fedorahosted.org/releases/e/l/elfutils/${pkgver}/elfutils-${pkgver}.tar.bz2
        elfutils-0.155-binutils-pr-ld-13621.patch)
sha1sums=('1b96084cd9fe037c1c0bd2c280aaa701f913462b'
          '8a8be7c0686c6311c1ce969ba10494e704ead48c')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
	
  export CC="${CC:-gcc} -m32"
  export CXX="${CXX:-g++} -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  CFLAGS+=" -g"  # required for test-suite success
  patch -Np1 -i ../elfutils-0.155-binutils-pr-ld-13621.patch

  
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/{bin,include,share}
}
