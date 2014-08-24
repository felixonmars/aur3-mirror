# Maintainer: Daniel Beal (killerbyte at xram dot co)

pkgname='lottosharesd'
pkgver=1.0.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://lottoshares.org/"
makedepends=('boost' 'miniupnpc' 'openssl')
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (QT)"
depends=(boost-libs miniupnpc openssl)
conflicts=(lottoshares)
source=("https://github.com/lottoshares/lottoshares/archive/$pkgver.tar.gz")
sha256sums=('91129ace4e390496f4f83d46e6da9c570996f6cc4012870ea979f4a06f6f7e36')

build() {
  cd "$srcdir/lottoshares-$pkgver/src"

  # and make daemon
  make -f makefile.unix lottosharesd
}


package() {
  cd "$srcdir/lottoshares-$pkgver/src"
  install -Dm755 lottosharesd "$pkgdir"/usr/bin/lottosharesd
  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

