# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-rgl
pkgver=0.92.798
pkgrel=1
pkgdesc="OpenGL 3D visualization device.  For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/rgl/index.html"
license=("GPL2")
depends=('r')
source=(http://cran.r-project.org/src/contrib/rgl_$pkgver.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./rgl
}


md5sums=('e74a5c07366a0556c8144f12df0600ba')
