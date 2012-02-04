# Contributor: Ivan Reche <ivan.reche@gmail.com>
pkgname=rcssbase
pkgver=11.1.0
pkgrel=3
pkgdesc="This product includes software developed by the University of California Berkeley and its contributors -- namely flex."
arch=('i686')
url="http://sserver.sourceforge.net/"
makedepends=('make' 'boost' 'gcc-libs' 'libtool')
source=(http://downloads.sourceforge.net/sourceforge/sserver/$pkgname-$pkgver.tar.bz2)
md5sums=('2792bc5abd9d7216786feef9d769d78c')
license=('GPL')

build() {
  cd $startdir/src/rcssbase-11.1.0/
  ./configure --prefix=/usr
  make
  make prefix=$startdir/pkg/usr install
}
