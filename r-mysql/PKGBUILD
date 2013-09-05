# Maintainer: Lydgate <archlinux@vo.racio.us>

pkgname=r-mysql
pkgver=0.9_3
pkgrel=1
pkgdesc="Database interface and MySQL driver for R"
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/RMySQL/"
license=('GPL2')
depends=(r r-dbi libmysqlclient)
source=(http://cran.r-project.org/src/contrib/RMySQL_${pkgver//_/-}.tar.gz)
md5sums=('0b3d337c638eadb175d200d8a08a0be0')

build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/R/library
  R CMD INSTALL -l $pkgdir/usr/lib/R/library RMySQL_${pkgver//_/-}.tar.gz
}
