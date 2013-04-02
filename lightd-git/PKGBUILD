# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=lightd-git
pkgver=0.0.1.58.g1642957
pkgrel=1
pkgdesc="A set of utility applications for working with the backlight"
arch=('i686' 'x86_64')
url="http://github.com/vodik/lightd"
license=('GPL')
depends=()
makedepends=('git')
conflicts=('lightd')
provides=('lightd')
source=('git://github.com/vodik/lightd.git')
sha1sums=('SKIP')

pkgver() {
  cd "lightd"
  git describe | sed 's/^v//;s/-/./g'
}

build() {
  make -C "lightd"
}

package() {
  make -C "lightd" DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
