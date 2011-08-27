# Maintainer: Juan Diego Tascon <juantascon@gmail.com>
# Contributor: Mildred <silkensedai@online.fr>

pkgname=mouseemu
pkgver=0.16
pkgrel=3
pkgdesc="Emulate mouse events"
arch=('i686' 'x86_64')
url="http://www.biophys.uni-duesseldorf.de/~schmitz/mouseemu/"
license=('GPL')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/mouseemu_$pkgver.orig.tar.gz)
md5sums=('0afbd50db4c16a7f3aff586df7619c59')

build() {
  cd "$srcdir/mouseemu"
  make || return 1
  install -d "$pkgdir/usr/sbin" "$pkgdir/usr/share/man/man8" || return 1
  make DESTDIR="$pkgdir" install || return 1
}
