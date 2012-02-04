# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=liborfa-hg
pkgver=45
pkgrel=1
pkgdesc="ORFA communication library"
arch=('i686' 'x86_64')
url="http://roboforum.ru/wiki/ORFA"
license=(MIT)
depends=()
makedepends=('cmake' 'mercurial')
conflicts=()
provides=(liborfa)
source=()
md5sums=()

_hgroot="http://hg.vehq.ru/"
_hgrepo=liborfa

build() {
  cd $startdir/src/$_hgrepo
  cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
