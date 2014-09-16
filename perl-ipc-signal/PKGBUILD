# Contributor: Andreas Wagner < Andreas dot Wagner at em dot uni-frankfurt dot de >

pkgname=perl-ipc-signal
pkgver=1.00
pkgrel=4
pkgdesc="Functions for translating signal names to numbers"
arch=(any)
url="http://www.argon.org/~roderick/"
license=('PerlArtistic')
depends=('perl')
source=(http://www.argon.org/~roderick/IPC-Signal-$pkgver.tar.gz)
md5sums=('4cebf17fdf1785eaf8c151bf2e8c360a')

build() {
  cd "${srcdir}/IPC-Signal-$pkgver"
  perl Makefile.PL
}

package() {
  cd "${srcdir}/IPC-Signal-$pkgver"
  make install DESTDIR=${pkgdir}
}


