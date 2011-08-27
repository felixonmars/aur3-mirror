# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-r_oo
pkgver=1.8.0
pkgrel=1
pkgdesc="R.oo: Methods and classes for object-oriented programming in the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/R.oo/index.html"
license=("GPL2")
depends=('r' 'r-r_methodss3')
source=(http://cran.r-project.org/src/contrib/R.oo_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./R.oo
}
md5sums=('22f33db4bf45867ad9b92d5b06969f91')
