# Maintainer: Tobias Neumann <mail at tobias dash neumann dot eu>

pkgname=r-munsell
pkgver=0.4
pkgrel=3
pkgdesc="Provides a range of axis labeling algorithms"
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/munsell/index.html"
license=('MIT')
depends=('r' 'r-colorspace')
source=(http://cran.r-project.org/src/contrib/munsell_$pkgver.tar.gz)

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./munsell
}

md5sums=('f14cae4a8c179f79746f96b867087791')
