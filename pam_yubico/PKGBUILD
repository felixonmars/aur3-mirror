# Maintainer: Linus Karlsson <arch at zozs dot se>
# Contributor: Peter Hultqvist <endnode dot se>
# Contributor: Fernando Jiménez Solano <fjim at sdfeu dot org>
pkgname=pam_yubico
pkgver=2.17
pkgrel=1
pkgdesc="Yubico Pluggable Authentication Module (PAM) "
arch=('i686' 'x86_64' 'armv6h')
url="http://opensource.yubico.com/yubico-pam/"
license=('custom:BSD')
depends=('ykclient' 'ykpers')
source=(
	"http://opensource.yubico.com/yubico-pam/releases/$pkgname-$pkgver.tar.gz"
)
sha256sums=('974a827ad960c1e7ce7b90338c319587aa878cf44d43c954e4af7cd843bbf571')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
	install -D -m0644 $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
