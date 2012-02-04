# Maintainer: Pang Yan Han <pangyanhan@gmail.com>
pkgname=powaur
pkgver=0.1.6
pkgrel=1
pkgdesc="An AUR helper with a pacman-like interface"
arch=('i686' 'x86_64')
url="http://github.com/yanhan/powaur"
license=('GPL')
depends=('curl' 'yajl' 'pacman')
source=("https://github.com/downloads/yanhan/powaur/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('322995712f881177fca5015279d2cd0f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
