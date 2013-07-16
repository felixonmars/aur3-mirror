# Maintainer: Luka Dornhecker <luka.dornhecker@gmail.com>
pkgname=chanloader
pkgver=0.0.1
pkgrel=4
pkgdesc="4chan command-line image downloader"
arch=("any")
url="https://github.com/lukad/chanloader"
license=("MIT")
makedepends=("go" "git")
_gourl="github.com/lukad/chanloader"

build() {
  GOPATH=$srcdir go get -v -d -x $_gourl
  cd $srcdir/src/$_gourl
  git checkout tags/v$pkgver
  GOPATH=$srcdir go install -v -x
}

package() {
  install -D -m755 $srcdir/bin/$pkgname $pkgdir/usr/bin/$pkgname || return 1
}

# vim:set ts=2 sw=2 et:
