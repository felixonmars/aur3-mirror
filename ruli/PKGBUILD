# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruli
pkgver=0.36
pkgrel=1
pkgdesc="Provides an easy-to-use interface for querying DNS SRV resource records"
url="http://www.nongnu.org/ruli"
license="GPL"
depends=('liboop')
source=(http://download.savannah.nongnu.org/releases/ruli/ruli_$pkgver.orig.tar.gz)
md5sums=('e73fbfdeadddb68a703a70cea5271468')

build() {
  cd $startdir/src/ruli-$pkgver
  make || return 1
  make INSTALL_BASE_DIR=$startdir/pkg/usr install
}
