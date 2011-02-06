# Contributor: Gilfran Ribeiro <contato at gilfran.net>

pkgname=putplus
pkgver=0.1
pkgrel=1
pkgdesc="It's equal to Put compiz plugin, but you now can move only through empty spaces if you want."
arch=('i686' 'x86_64')
url="http://edgurgel.wordpress.org"
depends=('compiz-core')
license=('GPL')
source=(http://www.gilfran.net/gil/archpkg/putplus-0.1.tar.gz)
md5sums=('4d05a1ba44851d5af65732d9a45f1df8')

build() {
cd $startdir/src/$pkgname
make || return 1
make DESTDIR=$startdir/pkg install
}
