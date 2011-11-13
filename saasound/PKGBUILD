# Contributor: fuzzix@gmail.com
pkgname=saasound
pkgver=3.2
pkgrel=1
pkgdesc="Phillips SAA 1099 sound chip emulator"
arch=('i686' 'x86_64')
url="http://simonowen.com/sam/saasound/"
license=('custom')
depends=()
source=(http://simonowen.com/sam/saasound/SAASound-3.2.tar.gz)
md5sums=('6a1e45f3f8958be6cfe88872cec3763f')

build() {
  cd "$srcdir/SAASound-$pkgver"
  ./configure --prefix=/usr
  make
}

package () {
  cd "$srcdir/SAASound-$pkgver"
  make DESTDIR=$pkgdir install
  install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


