# Maintainer: Geert Hendrickx <geert@hendrickx.be>

pkgname=hmaccalc
pkgver=0.9.13
pkgrel=1
pkgdesc="HMAC (hash-based message authentication code) calculator"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/hmaccalc/"
license=('BSD')
source=(https://fedorahosted.org/released/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('9a00b507555e45f58c1659d28f4d27e63373735a30cfe70e2c939f679cd266cc')
options=(!strip)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
