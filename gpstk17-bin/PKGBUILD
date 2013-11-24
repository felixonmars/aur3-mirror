#!/bin/bash
# ^ above shabeng-line is there to switch on automatic syntax highlighting in some editors.

# Maintainer:  dreieck
# Contributor: oldbay

# This PKGBUILD is taken and adapted from the PKGBUILD of the AUR-package 'gpstk-bin' (which has version 1.7), as of 2013-11-22.

pkgname=gpstk17-bin
pkgver=1.7
pkgrel=1

pkgdesc="Algorithms and frameworks supporting the development of processing and analysis applications in navigation and global positioning."
url="http://sourceforge.net/projects/gpstk"
license=('LGPL')

depends=()
makedepends=()
optdepends=()
provides=("gpstk=${pkgver}" "gpstk-bin=${pkgver}" "gpstk17=${pkgver}")
replaces=("gpstk<=${pkgver}" "gpstk-bin<=${pkgver}" "gpstk17<=${pkgver}")
conflicts=('gpstk' "gpstk-bin" "gpstk17")

arch=('i686' 'x86_64')

if   [[ "$CARCH" == 'i686' ]]; then
  source=("http://sourceforge.net/projects/gpstk/files/gpstk/$pkgver/gpstk-$pkgver.linux.x386.tar.gz")
  md5sums=('8eb58bb24f7309adf2204fe16449e865')
elif [[ "$CARCH" == 'x86_64' ]]; then
  source=("http://sourceforge.net/projects/gpstk/files/gpstk/$pkgver/gpstk-$pkgver.linux.amd64.tar.gz")
  md5sums=('23cc7cf61844cf67ed91107dde749578')
else
  source=("http://www.example.com/Source_is_CARCH-dependent._Have_a_look_at_the_PKGBUILD,_or_just_build_it,_to_get_the_right_source.")
  md5sums=('00000000000000000000000000000000')
  echo "Not-supported architecture. Aborting PKGBUILD." > /dev/stderr
  exit 1
fi

build() {
  true
}

package() {

if [[ "$CARCH" == 'x86_64' ]]; then
  _extractdir="${srcdir}/l64INSTALL"
else
  _extractdir="${srcdir}/gpstk"
fi

cd "${_extractdir}"


mkdir "$pkgdir/usr"

cp -r "${_extractdir}/bin" "$pkgdir/usr/"
cp -r "${_extractdir}/include" "$pkgdir/usr/"
cp -r "${_extractdir}/lib" "$pkgdir/usr/"

}
