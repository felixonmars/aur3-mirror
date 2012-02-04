# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-jgr
pkgver=1.7_5
pkgrel=1
pkgdesc="Java GUI for R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/JGR/index.html"
license=("GPL2")
depends=('r' 'r-iplots' 'r-javagd' 'r-rjava')
source=(http://cran.r-project.org/src/contrib/JGR_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./JGR
}
md5sums=('a3f2ee4d829b2f8a70ca2e905f7baea6')
