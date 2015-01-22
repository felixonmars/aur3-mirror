# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Hоàng Đức Hiếu <arch@zahe.me>
pkgname=nethogs-git
pkgver=0.8.1_snapshot
pkgrel=1
pkgdesc="monitor bandwidth usage by each process"
arch=('i686' 'x86_64')
url="https://github.com/raboof/nethogs"
license=('GPL')
depends=("gcc-libs" "libpcap" "ncurses")
conflicts=(nethogs)
source=("$pkgname::git+https://github.com/raboof/nethogs")
sha1sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
