# Maintainer: Thomas Kinnen <nihathrael@users.sourceforge.net>
# Contributor: Frank Oosterhuis <frank@scriptzone.nl>

pkgname=mysqlpp
pkgver=3.0.9
pkgrel=2
pkgdesc="MySQL++ is a C++ wrapper for MySQL's C API."
url="http://tangentsoft.net/mysql++/"
license=('LGPL')
depends=(libmysqlclient)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://tangentsoft.net/mysql++/releases/mysql++-$pkgver.tar.gz)
md5sums=('4acc1603846fe67d36b6243bfb805652')
arch=(i686 x86_64)

build() {
  cd $startdir/src/mysql++-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

