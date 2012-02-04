# Maintainer: Elifarley Cruz <first-name at gmail.com>

_bb_project=mbkp
pkgname=${_bb_project}-bb
pkgver=default
pkgrel=1
pkgdesc="modular backup tool using Duplicity as backend"
arch=(any)
url="http://bitbucket.org/elifarley/mbkp/"
license=(GPL)
depends=(duplicity 'bash>=3.1' coreutils sed)
makedepends=(curl perl)
dyn_source=("http://bitbucket.org/elifarley/${_bb_project}/get/$pkgver.tar.bz2")
provides=("mbkp")
conflicts=("mbkp")

set -e

build() {
  mkdir -p "$srcdir"
  curl --no-buffer --location "${dyn_source[0]}" --silent | tar -jx -C "$srcdir"
}

package() {
  cd "$srcdir/elifarley-${_bb_project}-$pkgver"
  ./installer/install.sh "$pkgdir"/usr
}

# vim:st=2:sw=2:et:

