# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-misc3d
pkgver=0.7_1
pkgrel=1
pkgdesc="A collection of 3D plots for the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/misc3d/index.html"
license=("LGPL2.1")
depends=('r' 'r-tkrplot')
source=(http://cran.r-project.org/src/contrib/misc3d_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./misc3d
}
md5sums=('3d9679fb354ca3e6e96c5575b8be31a5')
