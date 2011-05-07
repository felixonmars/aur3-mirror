# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-rgtk2
pkgver=2.20.12
pkgrel=1
pkgdesc="R Bindings for GTK2."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/RGtk2/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/RGtk2_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./RGtk2
}
md5sums=('7d8beae27fd9f15f74b5973763fd2117')
