# Maintainer Jipuf <jipuf@gmx.fr>

pkgname="libfixbuf"
pkgver="1.4.0"
pkgrel=1
pkgdesc="IPFIX Message Format Implementation"
arch=("i686" "x86_64")
url='http://aircert.sourceforge.net/fixbuf'
license=('GPL')
depends=('glib2>=2.6.4')
source=("http://tools.netsa.cert.org/releases/$pkgname-$pkgver.tar.gz")
md5sums=('712a99e3548b285059a32c70934bcb50')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
