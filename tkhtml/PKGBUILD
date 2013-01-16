# Contributor: Pavel Borzenkov <pavel.borzenkov@gmail.com>
# Contributor: rabyte <rabyte.at.pen.tj>

pkgname=tkhtml
pkgver=3.0
pkgrel=1
pkgdesc="A Tcl/Tk widget that displays HTML"
arch=('i686' 'x86_64')
url="http://tkhtml.tcl.tk/"
license=('BSD')
depends=('tcl' 'tk')
source=(http://vay8.net/txt/$pkgname-$pkgver.tgz)
md5sums=('64d6b3eade688c9ce23d5b40acac5fb2')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --with-tcl=/usr/lib --with-tk=/usr/lib
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  install -m644 -D COPYRIGHT $startdir/pkg/usr/share/licenses/$pkgname/COPYRIGHT
}
