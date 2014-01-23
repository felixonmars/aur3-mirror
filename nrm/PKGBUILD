pkgname=nrm
pkgver=1.0
pkgrel=1
pkgdesc="Nrm is a secure replacement for rm uses the Gutmann overwriting techniques in the background, making it suitable for everyday usage. "
arch=(any)
url="http://web.archive.org/web/20120217204148/http://www.synacklabs.net/projects/nrm/"
license=('GPL')
depends=('')
source=(http://web.archive.org/web/20120217204148/http://www.synacklabs.net/projects/nrm/nrm-1.0.tar.gz)
sha512sums=('d9d6e41d6008ff46b61f7d16165b370d1d5423c6707eb0dcd67fa18a5854170e4856555a3eb2e6aab90fa95cc7d01a9ef5ddb6fdc55ddd43d01cdf5db08de7c1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}


