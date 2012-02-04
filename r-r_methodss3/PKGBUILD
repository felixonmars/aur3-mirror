# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-r_methodss3
pkgver=1.2.1
pkgrel=2
pkgdesc="R.methodsS3: Methods that simplify the setup of S3 generic functions and S3 methods. For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/R.methodsS3/index.html"
license=("LGPL2.1")
depends=('r')
source=(http://cran.r-project.org/src/contrib/R.methodsS3_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./R.methodsS3
}
md5sums=('25813e5c449737d29829d85cac3fef55')
