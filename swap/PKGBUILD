# Contributor: Gilfran Ribeiro <contato at gilfran.net>

pkgname=swap
pkgver=0.1
pkgrel=1
pkgdesc="Exchange window's location and size. Simple like that. Useful when you have a main frame and others smaller windows on same desktop. You can quickly change the scope."
arch=('i686' 'x86_64')
url="http://edgurgel.wordpress.org"
depends=('compiz-core')
license=('GPL')
source=(http://www.gilfran.net/gil/archpkg/swap-0.1.tar.gz)
md5sums=('61b4cda7cdb8b1b3f7de008337cdfc7e')

build() {
cd $startdir/src/$pkgname
make || return 1
make DESTDIR=$startdir/pkg install
}
