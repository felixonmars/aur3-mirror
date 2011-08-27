# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=r-xml
pkgver=3.4_0
pkgrel=1
pkgdesc="Tools for parsing and generating XML within R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/XML/index.html"
license=("BSD")
depends=('r')
source=(http://cran.r-project.org/src/contrib/XML_${pkgver//_/-}.tar.gz)

build() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir
 R CMD INSTALL -l ../pkg/usr/lib/R/library ./XML || return 1
 install -D -m644 $srcdir/XML/DESCRIPTION $pkgdir/usr/share/licenses/r-xml/DESCRIPTION
}
md5sums=('cf75a0e56f2e7a822e9b1fc12f86b214')
