# Maintainer: vlirsub <vlirsub at gmail dot com>

pkgname=r-sqlite
pkgver=0.11.4
pkgrel=2
pkgdesc="Database Interface R language driver for SQLite."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/RSQLite/index.html"
license=("LGPL2.1")
depends=('r' 'r-dbi')
source=(http://cran.r-project.org/src/contrib/RSQLite_${pkgver}.tar.gz)
md5sums=('c2a1a8fca2146a910e9e13879a88cbc9')

package(){
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/R/library
  R CMD INSTALL -l $pkgdir/usr/lib/R/library RSQLite_${pkgver}.tar.gz
}