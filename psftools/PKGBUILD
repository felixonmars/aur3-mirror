# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=psftools
pkgver=1.0.7
pkgrel=2
pkgdesc="Utilities for manipulation of console fonts in PSF format"
arch=('i686' 'x86_64')
url="http://www.seasip.info/Unix/PSF/"
license=('GPL')
depends=('glibc')
options=('!libtool')
source=(http://www.seasip.info/Unix/PSF/$pkgname-$pkgver.tar.gz)
md5sums=('159022aae93a797dbc2a01014acbd115')

build() {
  cd  "$srcdir"/$pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man || return 1
  make || return 1
  make DESTDIR="$pkgdir" install
}
