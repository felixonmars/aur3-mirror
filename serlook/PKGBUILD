pkgname=serlook
pkgver=0.3.5
pkgrel=0
pkgdesc="A serial sniffer with IO capabilities and KDE based GUI."
arch=('any')
url="http://serlook.sourceforge.net/"
license=(GPL)
depends=('qt' 'kdelibs3')
builddepends=('unsermake' 'automake1.10')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  export PATH="/opt/qt/bin:$PATH"
  export QTDIR=/opt/qt
  cd $srcdir/
  tar -xzzf $pkgname-$pkgver.tar.gz
  cd $pkgname/
  LDFLAGS="-Wl,-O1,-z,relro"
  ./configure --without-arts
  make
}

package() {
  cd $srcdir/$pkgname/
  make PREFIX=/usr sysconfdir=/etc localstatedir=/var DESTDIR=$pkgdir install
}

md5sums=('f40ad98d274455a9a7aa2ad87d9746e3')
