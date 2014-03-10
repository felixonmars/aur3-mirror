# Contributor : Géraud Le Falher <daureg@gmail.com>
_pkgname=texworks
pkgname=texworks-svn
pkgver=1351
pkgrel=1
pkgdesc="A TeX IDE inspired by TeXShop."
url="http://tug.org/texworks"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('poppler-qt' 'hunspell')
makedepends=('subversion' 'cmake')
optdepends=('texlive-core')
conflicts=('texworks')
provides=('texworks')
source=('texworks::svn+http://texworks.googlecode.com/svn/trunk'
'texworks.desktop')
sha1sums=('SKIP' '68cc7d16293d5474ac7d19250a5d22d2c9dc404b')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  svnversion | tr -d [A-z]
}

build() {
  cd "${srcdir}/${_pkgname}"
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make || return 1
}

package() {
  cd ${srcdir}/${_pkgname}/build
 
  # binary
  install -D -m755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  # documentation
  install -d ${pkgdir}/usr/share/doc/${_pkgname}
  install -D -m644 ../README ${pkgdir}/usr/share/doc/${_pkgname}
  install -D -m644 ../NEWS ${pkgdir}/usr/share/doc/${_pkgname}

  # icon
  install -D -m644 ../res/images/TeXworks.png \
    ${pkgdir}/usr/share/pixmaps/TeXworks.png

  # manpage
  install -D -m644 ../man/${_pkgname}.1 ${pkgdir}/usr/share/man/man1/${_pkgname}.1

  # desktop
  install -D -m644 ${srcdir}/${_pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
# vim: set ft=sh ts=2 sw=2 et:
