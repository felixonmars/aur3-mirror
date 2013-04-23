# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
_pkgname=ccnping
pkgname=${_pkgname}-git
pkgver=17.e64843b
pkgrel=1
pkgdesc="ping server and client for CCNx"
arch=('i686' 'x86_64')
url="https://github.com/NDN-Routing/ccnping"
license=('unknown')
depends=('ccnx')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+https://github.com/NDN-Routing/ccnping.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX=/usr DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
