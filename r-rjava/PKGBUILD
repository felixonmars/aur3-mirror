# Maintainer: Federico Cerruti <druidofdarkforest@gmail.com>
pkgname=r-rjava
pkgver=0.9_6
pkgrel=1
pkgdesc="Low level Java VM interface for R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/rJava/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/rJava_${pkgver//_/-}.tar.gz)
md5sums=('935d35c11f6060137ddd95784055ef4c')
build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./rJava || return 1
 # If you get java errors, run R CMD javareconf as root
}
