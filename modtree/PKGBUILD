# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=modtree
pkgver=1
pkgrel=2
pkgdesc="tree based kernel module dependency viewer"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/modtree"
license=('GPL')
depends=('kmod' 'glibc')
source=("https://github.com/downloads/falconindy/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('17adda78f0e40e81412656906d328108')

build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix=/usr --with-rootprefix=/usr

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh
