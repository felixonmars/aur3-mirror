# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-deducer
pkgver=0.4_4
pkgrel=1
pkgdesc="Graphical data analysis system for R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/Deducer/index.html"
license=("GPL2")
depends=('r' 'r-car' 'r-ggplot2' 'r-effects' 'r-jgr' 'r-multcomp' 'r-rjava')
source=(http://cran.r-project.org/src/contrib/Deducer_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./Deducer || return 1
 # If you get java errors, run R CMD javareconf as root
}
md5sums=('7f1858d3948b730cb939ed2d429159df')
