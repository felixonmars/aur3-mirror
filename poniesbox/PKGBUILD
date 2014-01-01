# Maintainer: Alexey Kharlamov <maintain@2-47.ru>
pkgname=poniesbox
pkgver=0.8.1
pkgrel=1
pkgdesc="Ponies walking on your desktop"
arch=("i686" "x86_64")
url="https://bitbucket.org/XRevan86/poniesbox"
license=('GPL3+')
depends=("qt4" "libxfixes")
optdepends=('phonon: Speech support')
source=("https://bitbucket.org/XRevan86/$pkgname/downloads/$pkgname-$pkgver.tar.xz")
sha1sums=('4d666e52c0471244d162e07a5e86c78d22161f46')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	lrelease-qt4 "$pkgname.pro"
	qmake-qt4 \
	  QMAKE_STRIP="true" PREFIX="/usr" "$pkgname.pro"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}
