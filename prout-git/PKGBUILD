# Maintainer: Willy GOIFFON <willy at mailoo dot org>

pkgname=prout-git
_pkgname=${pkgname%-git}
pkgver=1.0
pkgrel=1
pkgdesc='Print out a document via the default printer'
arch=('i686' 'x86_64')
url='http://git.z3bra.org/cgit.cgi/prout'
license=('WTFPL')
depends=('libcups')
makedepends=('git')
provides=('prout')
source=('git://z3bra.org/prout')
  md5sums=( 'SKIP' )

pkgver() {
  cd "$_pkgname"
  echo "${pkgver}.$(git rev-list --count HEAD).$(git log -1 --pretty=format:%h)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sts=2 sw=2 et:

