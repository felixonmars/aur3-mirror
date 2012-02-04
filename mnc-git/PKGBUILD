# Maintainer: Louis R. Marascio <lrm at fitnr dot com>

pkgname=mnc-git
pkgver=20110918
pkgrel=1
pkgdesc="Multicast NetCat. A NetCat-like utility for multicast"
arch=('i686' 'x86_64')
url="http://github.com/marascio/mnc"
license=('BSD')
depends=('boost-libs' 'sh')
makedepends=('make' 'git' 'gcc')
source=()

_gitroot="git://github.com/marascio/mnc"
_gitname="mnc"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  git clone $_gitroot $_gitname
  cd "$srcdir/$_gitname"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
