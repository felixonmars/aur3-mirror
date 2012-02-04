# $Id$
# Maintainer: Christoph Giesel <mail.cgiesel.de>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Johannes Weiner <hannes@saeurebad.de>

_pkgbasename=libsigsegv
pkgname=lib32-libsigsegv
pkgver=2.6
pkgrel=1
arch=('x86_64')
pkgdesc="Page fault detection library (32 Bit)"
url="http://libsigsegv.sourceforge.net/"
license=('GPL2')
depends=('lib32-glibc' "${_pkgbasename}")
options=('!libtool')
source=(http://ftp.gnu.org/gnu/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('7e24993730649d13c6eabc28bd24de35')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  ./configure --prefix=/usr --libdir=/usr/lib32 --enable-shared
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Clean up lib32 package
  rm -rf "${pkgdir}"/usr/{bin,include,share/man}
}
