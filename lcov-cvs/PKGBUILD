# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Jordi De Groof <jordi dot degroof at gmail dot com>

pkgname=lcov-cvs
pkgver=20140112
pkgrel=1
pkgdesc="front-end for GCC's coverage testing tool gcov"
arch=('any')
url="http://ltp.sourceforge.net/coverage/lcov.php"
license=('GPL')
depends=('perl')
makedepends=('cvs')
optdepends=('perl-gd: for genpng support')
provides=('lcov')
conflicts=('lcov')
source=()

_cvsroot=':pserver:anonymous@ltp.cvs.sourceforge.net:/cvsroot/ltp'
_cvsmod='utils/analysis/lcov'

build() {
  cd "${srcdir}"
  msg "Connecting to ${_cvsmod}.sourceforge.net CVS server...."

  if [[ -d "${_cvsmod}/CVS" ]]; then
    cd "${_cvsmod}"
    cvs -z3 update -d
  else
    cvs -z3 -d "${_cvsroot}" co -f "${_cvsmod}"
    cd "${_cvsmod}"
  fi

  msg "CVS checkout done or server timeout"
}

package() {
  cd "${srcdir}/${_cvsmod}"
  make PREFIX="${pkgdir}/" install
}
