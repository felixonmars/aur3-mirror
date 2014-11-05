# Maintainer: Tim Reddehase <robustus@rightsrestricted.com>

pkgname=hets-lib-git
pkgver=1408455795
pkgver() {
  cd "$srcdir/hets-lib"
  git log -1 --format='%ct'
}
pkgrel=1
pkgdesc="Library files for Hets."
url="http://www.informatik.uni-bremen.de/agbkb/forschung/formal_methods/CoFI/hets/index_e.htm"
arch=('any')
license=('CUSTOM')
depends=()
makedepends=('git')
provides=('hets-lib')
conflicts=('hets-lib')
source=('git+https://github.com/spechub/hets-lib.git')
sha1sums=('SKIP')

package() {
  cd ${srcdir}

  mkdir -p ${pkgdir}/opt/

  cp -r ${srcdir}/* ${pkgdir}/opt/
}
