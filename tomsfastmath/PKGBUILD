# $Id$
# Maintainer: Michael Fellinger <manveru@www.weez-int.com>
pkgname=tomsfastmath
_pkgname=tfm
pkgver=0.12
pkgrel=1
pkgdesc="TomsFastMath is a fast public domain, open source, large integer arithmetic library written in portable ISO C."
url="http://libtom.org/?page=features&newsitems=5&whatfile=tfm"
license="public domain"
arch=('i686' 'x86_64')
depends=()
makedepends=()
conflicts=('libtommath')
replaces=('libtommath')
backup=()
install=
source=("http://libtom.org/files/${_pkgname}-${pkgver}.tar.bz2")
md5sums=()

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
