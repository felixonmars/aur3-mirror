# Maintainer: Linus Karlsson <arch at zozs dot se>
# Contributor: Peter Hultqvist <endnode dot se>
pkgname=ykclient
pkgver=2.12
pkgrel=1
pkgdesc="Yubico C client library"
replaces=('libyubikey-client')
arch=("i686" "x86_64" "armv6h")
url="http://yubico.github.io/yubico-c-client/"
license=("custom:BSD")
depends=('libyubikey')
makedepends=('help2man')
source=("http://yubico.github.io/yubico-c-client/releases/$pkgname-$pkgver.tar.gz")
sha1sums=('518ce53ba9ef61a619f9150778f19fad23014a9c')
sha256sums=('eda62475b51e488686ec82564c82bd707eeb30a2fe74a24a5ced2a730f74198c')

build() {
	cd "$srcdir"/$pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
	install -D -m0644 $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
