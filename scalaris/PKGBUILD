# Maintainer: Roman Parykin <donderom at ymail dot com>

pkgname=scalaris
pkgver=0.5.0
pkgrel=1
pkgdesc="A scalable, transactional, distributed key-value store."
arch=('i686' 'x86_64')
url="http://code.google.com/p/scalaris/"
license=('Apache')
depends=('openssl' 'erlang>=R13B01')
optdepends=('tokyocabinet: storage on disk')
backup=('etc/scalaris.cfg' 'etc/scalaris.local.cfg' 'etc/scalarisctl.conf')
source=(http://scalaris.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('65b74551ea92afe250e2bda07d278c10')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  
  # put the LICENSE file to the licenses
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
