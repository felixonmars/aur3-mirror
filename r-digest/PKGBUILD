# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-digest
pkgver=0.6.3
pkgrel=1
pkgdesc="Provides functions for the creation of ‘hash’ digests of arbitrary R objects using the md5, sha-1, sha-256 and crc32 algorithms."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/digest/index.html"
license=('GPL2')
depends=('r')
source=(http://cran.r-project.org/src/contrib/digest_$pkgver.tar.gz)

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./digest
}
md5sums=('d7913e8091a31885ee2ab798badd7958')
