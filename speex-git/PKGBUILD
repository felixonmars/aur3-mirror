# Maintainer: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=speex-git
pkgver=speex.1.2beta2.263.ga6d05eb
pkgrel=1
pkgdesc="A free codec for free speech"
arch=('i686' 'x86_64')
url="http://www.speex.org/"
license=('BSD')
depends=('libogg')
makedepends=('git')
provides=('speex')
conflicts=('speex')
options=('!libtool')
source=("git+http://git.xiph.org/speex.git/")
sha256sums=('SKIP')
_gitname=speex

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd "$srcdir/$_gitname"
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
	install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

