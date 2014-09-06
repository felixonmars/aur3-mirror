# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=cayley-git
_pkgname=cayley
pkgver=v0.3.1.r153.ga96f2ef
pkgrel=1
pkgdesc="An open-source graph database"
arch=('x86_64' 'i686')
url="https://github.com/google/$pkgname"
license=('APACHE')
depends=('go')
makedepends=('mercurial' 'bzr')
optdepends=(
  'leveldb: single machine storage'
  'mongodb: nosql storage'
)
options=('!strip' '!emptydirs')
_gourl=github.com/google/cayley

build() {
  GOPATH="$srcdir" go get -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
}

pkgver() {
  cd $srcdir/src/github.com/google/$_pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
