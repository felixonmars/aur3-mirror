#                                                 -*- shell-script -*-
# Contributor: Eric Schulte <schulte.eric@gmail.com>
pkgname=cl-launch-git
pkgver=3.011.1.22.gd87a1bd
pkgrel=1
pkgdesc="utility to make Lisp software easily invokable from the command-line"
arch=('any')
url="http://www.cliki.net/cl-launch"
license=('LLGPL')
depends=()
makedepends=('git')
provides=('cl-launch')
source=(git+http://common-lisp.net/project/xcvb/git/cl-launch.git)
md5sums=('SKIP')

_gitname="cl-launch"

pkgver() {
  cd $_gitname
  git describe --always|sed 's/debian.//;s/-/./g'
}

build() {
  cd "$srcdir"/${_gitname}

  ## Build
  make
}

package() {
  cd "$srcdir"/${_gitname}
  mkdir -p $pkgdir/usr/bin
  make PREFIX=$pkgdir/usr/ install
}
