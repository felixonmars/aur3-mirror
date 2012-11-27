# Contributor: Ivy Foster <joyfulgirl (at) archlinux (dot) us>

# Make sure to disable the --user-agent option in your
#   .curlrc and/or makepkg.conf before downloading.
#    Sourceforge will send you the download page, otherwise!
pkgname=bibutils-dynamic
_basename=bibutils
pkgver=4.15
pkgrel=1
pkgdesc="Bibliography conversion tools, with dynamic libs"
arch=("i686" "x86_64")
url="http://sourceforge.net/p/bibutils/home/Bibutils/"
license=('GPL2')
makedepends=('tcsh')
provides=('bibutils')
changelog=ChangeLog
source=("http://downloads.sourceforge.net/project/${_basename}/${_basename}_${pkgver}_src.tgz")
md5sums=('b13a26ae79aabf5fc0007d1bf3a4eeb3')

build() {
  cd "${srcdir}/${_basename}_$pkgver"
  ./configure --dynamic \
              --install-dir ${pkgdir}/usr/bin \
              --install-lib ${pkgdir}/usr/lib
  make
}

package() {
  install -d ${pkgdir}/usr/{bin,lib}
  cd "${srcdir}/${_basename}_$pkgver"
  make install
}

# vim:set ts=2 sw=2 et:
