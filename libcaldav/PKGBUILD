# Maintainer: Jorge Villaseñor <salinasv at gmail dot com>

pkgname=libcaldav
pkgver=0.6.2
pkgrel=1
pkgdesc="A client library adding support for the CalDAV protocol (rfc4791). The intension is to have a library which fully implements the protocol so that anybody with relative ease can add CalDAV support to there application."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libcaldav/"
license=('GPL')
groups=()
depends=('curl' 'glib2')
makedepends=(doxygen)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-0.6/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('1fe80a58b4e018a7b82feee4f806a3fd')

build() {
  cd $srcdir/$pkgname-$pkgver
  autoreconf
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
