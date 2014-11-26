# Maintainer: Lydgate <archlinux@vo.racio.us>

pkgname=r-dbi
pkgver=0.3.1
pkgrel=1
pkgdesc="A database interface (DBI) definition for communication between R and relational database management systems"
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/DBI/"
license=('GPL2')
depends=(r libmysqlclient)
source=(http://cran.r-project.org/src/contrib/DBI_${pkgver}.tar.gz)
md5sums=('1293e8656d824b4df6bbb67365ddaf63')

build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/R/library
  R CMD INSTALL -l $pkgdir/usr/lib/R/library DBI_${pkgver}.tar.gz
}
