# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-cairodevice
pkgver=2.15
pkgrel=1
pkgdesc="Cairo/GTK graphics device driver for R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/cairoDevice/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/cairoDevice_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./cairoDevice
}
md5sums=('7d11e10d8cd1097e0493f84d9d09daca')
