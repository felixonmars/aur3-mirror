# Maintainer: William Robertson <wkr@wkr.io>

pkgname=replicant
pkgver=0.6.0
pkgrel=1
pkgdesc="Tool for creating replicated state machines."
arch=('i686' 'x86_64')
url="https://github.com/rescrv/Replicant"
license=('BSD')
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
depends=('libpo6' 'libe' 'busybee' 'hyperleveldb' 'google-glog')
md5sums=('0a57d4f3598b7772f2f6dcdcb46d2528')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
