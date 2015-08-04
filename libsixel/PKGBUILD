# Maintainer: haru <uobikiemukot at gmail dot com>
pkgname=libsixel
pkgver=r1938.8849016
pkgrel=2
pkgdesc='A lightweight, fast implementation of DEC SIXEL graphics codec'
arch=('x86_64' 'i686')
url='https://github.com/saitoha/libsixel'
license=('MIT')
depends=('curl' 'libjpep' 'libpng')
makedepends=()
checkdepends=()

_gitname=libsixel
_gitbranch=master
source=("${_gitname}::git+https://github.com/saitoha/libsixel#branch=${_gitbranch}")
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
}
