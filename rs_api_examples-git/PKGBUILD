# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/rs_api_examples-git/PKGBUILD

pkgname=rs_api_examples-git
_gitname=rs_api_examples
pkgver=r198.0f2ecbe
pkgrel=2
pkgdesc="A simple set of example sh/bash scripts for using the RightScale API."
arch=('any')
url="https://github.com/flaccid/rs_api_examples"
license=('Apache 2.0')
depends=('bash')
makedepends=('git')
provides=('rs_api_examples')
source=("git://github.com/flaccid/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp -Rv "$srcdir/$_gitname/bin/"* "$pkgdir/usr/bin/"
}
