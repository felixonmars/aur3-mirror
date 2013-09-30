# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Marcin Skory <armitage at q84fh dot net>

_pkgname=ponscripter
pkgname=${_pkgname}-hg
pkgver=371
pkgrel=2
pkgdesc="NScripter-style novel-game interpreter with an emphasis on supporting games in Western languages (Mercurial version)"
arch=('i686' 'x86_64')
url='http://unclemion.com/dev/projects/ponscripter'
license=('GPL')
depends=('gcc-libs' 'sdl_mixer' 'sdl_image' 'bzip2' 'freetype2')
makedepends=('mercurial')
provides=('ponscripter')
conflicts=('ponscripter-svn' 'ponscripter')
source=('hg+http://unclemion.com/hg/ponscripter')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(hg identify -n)
}

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i "36i\#include <unistd.h>" ./src/AnimationInfo.h
  ./configure --prefix=/usr --no-werror
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m755 "${srcdir}/${_pkgname}/src/ponscr" "${pkgdir}/usr/bin/ponscripter"
  install -dm755 "${pkgdir}/usr/share/doc/ponscripter"
  install -m644 BUGS CHANGES INSTALL README "${pkgdir}/usr/share/doc/ponscripter"

  # man page is broken, so I skipped it
  # cd "${srcdir}/${_pkgname}/doc"
  # install -dm755 "${pkgdir}/usr/share/man/man6/"
  # install -dm755 "${pkgdir}/usr/share/man/man7/"
  # install -m644 ponscr.6 "${pkgdir}/usr/share/man/man6/"
  # install -m644 ponscr-ext.7 ponscripter.7 ponscr-syntax.7 "${pkgdir}/usr/share/man/man7/"
}

# vim:set ts=2 sw=2 et:
