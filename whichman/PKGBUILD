# Maintainer: philomath <philomath868 AT gmail DOT com>
# Contributor: Jekyll Wu <adaptee [at] gmail [dot] com>

pkgname=whichman
pkgver=2.4
pkgrel=1
pkgdesc="fault tolerant search utilities for manpages and commands"
arch=('i686' 'x86_64')
url="http://linuxfocus.org/~guido/#whichman"
license=('GPL')
depends=(glibc)
source=("http://linuxfocus.org/~guido/$pkgname-$pkgver.tar.gz")
md5sums=('cc3d35f26bbd8bf99f4f16b276384333')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
