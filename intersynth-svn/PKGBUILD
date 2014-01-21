# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

pkgname=intersynth-svn
_pkgbasename=intersynth
pkgver=0
pkgrel=1
pkgdesc="A tool that generates interconnects for reconfigurable logic circuits"
arch=('i686' 'x86_64')
url="http://www.clifford.at/intersynth/"
license=('GPLv2')
depends=()
makedepends=('subversion')
source=(intersynth::svn+http://svn.clifford.at/intersynth/trunk
        intersynth-Makefile-Arch-Linux.patch)
sha256sums=('SKIP'
            '7a97c55b7ce9ee98e9ce7a12ff7c29c199f1b50458c85844bf0e41bd215d9ab1')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"

  local ver="$(svnversion)"
  printf "0.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}/${_pkgbasename}"

  patch -Np0 -i "${srcdir}/intersynth-Makefile-Arch-Linux.patch"
}

build() {
  cd "${srcdir}/${_pkgbasename}"

  make
}

package() {
  cd "${srcdir}/${_pkgbasename}"

  install -d "${pkgdir}/usr/bin"

  make DESTDIR="${pkgdir}/usr" install

  # Install examples
  install -d "${pkgdir}/usr/share/${_pkgbasename}"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgbasename}/examples" "${pkgdir}/usr/share/${_pkgbasename}"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgbasename}/flowex" "${pkgdir}/usr/share/${_pkgbasename}"
}

# vim: set ts=2 sw=2 ft=sh noet:
