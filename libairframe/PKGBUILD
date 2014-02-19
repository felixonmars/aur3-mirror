# Maintainer Jipuf <jipuf@gmx.fr>

pkgname="libairframe"
pkgver="0.6.2"
pkgrel=2
pkgdesc="Airframe Application Utility Library"
arch=('i686' 'x86_64')
url='http://aircert.sourceforge.net/airframe'
license=('GPL')
depends=('glib2>=2.6.4' 'libpcap')
source=("http://downloads.sourceforge.net/sourceforge/aircert/$pkgname-$pkgver.tar.gz")
md5sums=('d38434992d3e63e5ec3caedef000ca03')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
