# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Contributor: robotanarchy

# This is the normal giflib PKGBUILD, just without the x11
# dependency for headless servers
#
# See also:
# https://projects.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/giflib
#

pkgname=giflib-nox11
_pkgname=giflib
pkgver=4.1.6
pkgrel=5
pkgdesc="A library for reading and writing gif images, no x11 dependency"
url="http://sourceforge.net/projects/giflib/"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
provides=("libungif=${pkgver}" "giflib=${pkgver}")
conflicts=('libungif' 'giflib')
replaces=('libungif' 'giflib')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/giflib/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('7125644155ae6ad33dbc9fc15a14735f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i '/AC_PATH_XTRA/d' configure.ac
  libtoolize -f
  autoreconf
  ./configure --prefix=/usr --disable-static --disable-x11
  make

  # libungif compatibility - instructions taken from Redhat specfile
  MAJOR=`echo ${pkgver} | sed 's/\([0-9]\+\)\..*/\1/'`
  gcc -shared -Wl,-soname,libungif.so.${MAJOR} -Llib/.libs -lgif -o libungif.so.${pkgver}
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -m755 libungif.so.${pkgver} "${pkgdir}/usr/lib/"
  ln -sf libungif.so.${pkgver} "${pkgdir}/usr/lib/libungif.so.4"
  ln -sf libungif.so.4 "${pkgdir}/usr/lib/libungif.so"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
