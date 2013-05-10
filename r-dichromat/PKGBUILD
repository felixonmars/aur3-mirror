# Maintainer: Tobias Neumann <mail at tobias dash neumann dot eu>

pkgname=r-dichromat
pkgver=2.0_0
pkgrel=1
pkgdesc="Collapse red-green distinctions to simulate the effects of colour-blindness"
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/dichromat/index.html"
license=('GPL-2')
depends=('r')
source=(http://cran.r-project.org/src/contrib/dichromat_2.0-0.tar.gz)

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./dichromat
}

md5sums=('84e194ac95a69763d740947a7ee346a6')
