# Contributor: Tor Aqissiaq <toraqissiaq at gmail dot com>

pkgname=gtkclock
pkgver=0.1
pkgrel=1
pkgdesc="gtkclock is a simple digital clock. It goes nicely into a taskbar."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gtkclock/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/project/gtkclock/gtkclock/gtkclock-0.1/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('f06c1a3bdff6682a75f927f3606de860')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}