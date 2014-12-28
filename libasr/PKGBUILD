# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=libasr
pkgver=1.0.0
pkgrel=1
pkgdesc='A FREE asynchronous DNS resolver.'
arch=('i686' 'x86_64')
url="http://www.opensmtpd.org/"
license=('BSD')
depends=('libevent' 'openssl')
provides=('libasr')
options=(!strip)
source=("http://www.opensmtpd.org/archives/$pkgname-$pkgver.tar.gz")
sha256sums=('fcb1d47981916a1a3cfcb971e8d0d34db2209026e029c84854e51719cac1922f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 LICENCE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
 
