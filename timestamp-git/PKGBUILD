# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname=timestamp-git
pkgver=25.7d99e8c
pkgrel=1
pkgdesc="Prefix each line with a timestamp"
arch=(i686 x86_64)
url="http://koldfront.dk/git/timestamp/"
license=('GPL3')
makedepends=(git)
source=(git+http://koldfront.dk/git/timestamp/)
md5sums=(SKIP)

_gitname=timestamp

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# eof
