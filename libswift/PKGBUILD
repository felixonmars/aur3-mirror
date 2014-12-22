# Maintainer: RunningDroid <runningdroid AT zoho.com>
pkgname=libswift
pkgver=r769.bbe050b
pkgrel=2
pkgdesc="The multiparty transport protocol"
arch=('i686' 'x86_64')
url="http://libswift.org"
license=('LGPL')
depends=('libevent')
makedepends=('git')
source=('git+https://github.com/libswift/libswift.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm755 "$srcdir/libswift/swift" "$pkgdir/usr/bin/swift"
  install -dm755 "$pkgdir/usr/share/doc/libswift"
  cp -r -t "$pkgdir/usr/share/doc/libswift" "$srcdir"/libswift/doc/*
}

# vim:set ts=2 sw=2 et:
