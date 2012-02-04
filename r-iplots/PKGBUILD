# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-iplots
pkgver=1.1_3
pkgrel=1
pkgdesc="Interactive graphics for R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/iplots/index.html"
license=("GPL2")
depends=('r' 'r-rjava')
source=(http://cran.r-project.org/src/contrib/iplots_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./iplots || return 1
 # If you get java errors, run R CMD javareconf as root
}
md5sums=('33444401f8bd28f421749d0af6868dec')
