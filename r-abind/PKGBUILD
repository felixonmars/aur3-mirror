# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-abind
pkgver=1.3_0
pkgrel=1
pkgdesc="Combine multi-dimensional arrays.  For the R language."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/abind/index.html"
license=("LGPL2.1")
depends=('r')
source=(http://cran.r-project.org/src/contrib/abind_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./abind
}
md5sums=('f147a41fb72bad40dc569d6b66b3cfe7')
