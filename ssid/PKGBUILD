# Contributor: Evan Gates    <evan.gates@gmail.com>
#              Dag  Odenhall <dag.odenhall@gmail.com>

pkgname=ssid
pkgver=0.1
pkgrel=5
pkgdesc="Simple setsid replacement"
url='http://tools.suckless.org/ssid'
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
source=('http://dl.suckless.org/tools/ssid-0.1.tar.gz')
md5sums=('8740013208d79ef4d7ce7fe0c1f12e87')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/CFLAGS = /CFLAGS = ${CFLAGS} /" config.mk
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
