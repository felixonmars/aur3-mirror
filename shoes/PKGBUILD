# $Id$
# Contributor: Michael Fellinger <m.fellinger@gmail.com>
# Modified by: Matias Korhonen <webadmin@draco-vulgaris.net>

pkgname=shoes
pkgver=2
_pkgrev=0.r1134
pkgrel=1
pkgdesc="Informal graphics and windowing toolkit."
url="http://shoooes.net"
arch=(any)
license="MIT"
depends=(ruby giflib gtk2 giflib vlc curl)
makedepends=() # depends on rake, but that's a gem
conflicts=()
replaces=()
backup=()
source=("http://hacketyhack.net/pkg/dist/$pkgname/$pkgname-$_pkgrev.tar.gz")
md5sums=("826433cdeb80133899bbb694f7aded8a")

build() {
  cd $srcdir/$pkgname-$_pkgrev || return 1
  make PREFIX=/usr DESTDIR=$pkgdir install || return 1
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
