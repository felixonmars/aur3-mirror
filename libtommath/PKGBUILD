# Contributer: Michael Fellinger <manveru@www.weez-int.com>
# Maintainer: suasageandeggs <s_stoakley@hotmail.co.uk>
pkgname=libtommath
pkgver=0.42.0
pkgrel=1
pkgdesc="LibTomMath is a free public domain portable number theoretic multiple-precision integer library written entirely in C."
url="http://libtom.org/?page=features&newsitems=5&whatfile=ltm"
license=('public domain')
arch=('i686' 'x86_64')
depends=()
makedepends=()
conflicts=('tomsfastmath')
replaces=('tomsfastmath')
backup=()
source=("http://libtom.org/files/ltm-${pkgver}.tar.bz2")

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$pkgdir install
}
md5sums=('7380da904b020301be7045cb3a89039b')
