# Maintainer: Tobias Neumann <mail at tobias dash neumann dot eu>

pkgname=r-gtable
pkgver=0.1.2
pkgrel=1
pkgdesc="Tools to make it easier to work with "tables" of grobs."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/gtable/index.html"
license=('GPL-2')
depends=('r')
source=(http://cran.r-project.org/src/contrib/gtable_$pkgver.tar.gz)

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./gtable
}

md5sums=('be491aa5220f0059a0e1cb04679b6563')
