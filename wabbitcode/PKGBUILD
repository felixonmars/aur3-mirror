# Contributor: Jon Sturm <jasturm002@aol.com>
pkgname=wabbitcode
pkgver=1.0
pkgrel=4
pkgdesc="A Z80 assembly IDE for multiple platforms aimed at development for TI Calculators"
arch=(i686 x86_64)
url="http://www.revsoft.org/phpBB2/viewforum.php?f=25"
license=('GPL')
depends=(gtk2 openssl gmp)
makedepends=(pkgconfig)
provides=(spasm) 
source=(http://group.revsoft.org/$pkgname-$pkgver.tar.gz)
md5sums=('c74ce443d7e3e39e2369f168df967453')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

