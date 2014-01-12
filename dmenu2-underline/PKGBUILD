# Maintainer: Nick <solitarycipher@gmail.com>

pkgname=dmenu2-underline
pkgver=0.3
pkgrel=1
pkgdesc="Fork of dmenu with many useful patches applied and additional options like screen select, dim or opacity change. Also added underline options."
url="https://bitbucket.org/solitarycipher/dmenu2"
arch=('i686' 'x86_64')
license=('MIT')
license=('GPL')
depends=('libxinerama' 'libxft')
provides=(dmenu)
conflicts=(dmenu)

source=(https://bitbucket.org/solitarycipher/dmenu2/downloads/dmenu2-$pkgver.tar.gz)
md5sums=('ac621fd9eff9282a690381fb384b6a69')

build() {
	cd "$srcdir/dmenu2-$pkgver"
	make
}

package() {
	cd "$srcdir/dmenu2-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
