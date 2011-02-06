# Contributor: Gilfran Ribeiro <contato at gilfran.net>

pkgname=smartput
pkgver=0.1
pkgrel=1
pkgdesc="Cleverly find the best gap suitable for the current window."
arch=('i686' 'x86_64')
url="http://edgurgel.wordpress.org"
depends=('compiz-core')
license=('GPL')
source=(http://www.gilfran.net/gil/archpkg/smartput-0.1.tar.gz)
md5sums=('237891917b0e3c1433c63a459624fbe6')

build() {
cd $startdir/src/$pkgname
make || return 1
make DESTDIR=$startdir/pkg install
}
