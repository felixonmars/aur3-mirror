# Maintainer: Vivien Didelot <vivien+aur@didelot.org>
_ghuser=vivien
pkgname=i3blocks
pkgver=1.2
pkgrel=1
pkgdesc='Define blocks for your i3bar status line'
arch=('any')
url="https://github.com/$_ghuser/$pkgname"
license=('GPL3')
source=("https://github.com/$_ghuser/$pkgname/archive/$pkgver.tar.gz")
md5sums=('09404d027ab88bb018ac82609a1287f4')

build () {
  make -C "$srcdir/$pkgname-$pkgver" VERSION="$pkgver" PREFIX=/usr
}

package () {
  make -C "$srcdir/$pkgname-$pkgver" VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim: et ts=2 sw=2
