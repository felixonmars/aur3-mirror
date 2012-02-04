# Contributor: Havanna <havanna.sha@gmail.com>

pkgname=llk_linux
_llkmajorver=2.3
_llkver=beta1
pkgver=${_llkmajorver}${_llkver}
pkgrel=6
pkgdesc="Chinese lianliankan game"
arch=('i686' 'x86_64')
url="http://llk-linux.sourceforge.net"
license=('GPL2')
depends=('glib2' 'gettext' 'esound')
makedepends=('pkgconfig' 'libtool')
source=("http://llk-linux.sourceforge.net/dist/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2ad7a4bf11b95f55eed8f977377b55a61aecc8729367bb28412e3bfd303adf49')

build() {
	cd "$srcdir/$pkgname-$_llkmajorver"
	./configure --prefix=/usr || return 1
	make
}

package() {
	cd "$srcdir/$pkgname-$_llkmajorver"
	make DESTDIR="$startdir/pkg" install || return 1
	install -Dm644 "$startdir/src/$pkgname-$_llkmajorver"/llk_linux.desktop \
		"$pkgdir"/usr/share/applications/llk_linux.desktop.desktop
}
