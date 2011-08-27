# Contributor: Shayne Sweeney <shayne@shaynesweeney.com>
pkgname=libipod
pkgver=0.1
pkgrel=1
pkgdesc="A library written in C for managing Apple iPods. Includes bindings for C++ and Python."
url="http://libipod.sourceforge.net"
options=('NOLIBTOOL')
license="GPL"
depends=()
source=(http://dl.sourceforge.net/sourceforge/libipod/libipod-$pkgver.tgz)
md5sums=('c219cae62804ae1add9d88c24469fe31')

build() {
  cd $startdir/src/libipod-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
