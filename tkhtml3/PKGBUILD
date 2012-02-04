# Contributor: Pavel Borzenkov <pavel.borzenkov@gmail.com>
# Contributor: rabyte <rabyte.at.pen.tj>

pkgname=tkhtml3
pkgver=alpha16
pkgrel=1
pkgdesc="A Tcl/Tk widget that displays HTML"
arch=('i686' 'x86_64')
url="http://tkhtml.tcl.tk/"
license=('BSD')
depends=('tk')
source=(http://tkhtml.tcl.tk/$pkgname-alpha-16.tar.gz)
md5sums=('1bed3863ded3f695b6fe65ec02e7c0df')

build() {
  cd $startdir/src/htmlwidget

  ./configure --prefix=/usr --with-tcl=/usr/lib --with-tk=/usr/lib
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  install -m644 -D COPYRIGHT $startdir/pkg/usr/share/licenses/$pkgname/COPYRIGHT
}
