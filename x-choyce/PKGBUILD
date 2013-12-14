# Maintainer: Jochen Keil jrk+x:choyce@sternenrei.ch

pkgname=x-choyce
pkgver=2013.12.13
pkgrel=0
pkgdesc="A light-weight, Exposé-like window switcher for X (feat. OpenGL)."
arch=('i686' 'x86_64')
url="https://github.com/jrk-/x-choyce"
license=("BSD")
depends=('mesa' 'libxcb' 'libx11' 'libxrender' 'libxft' \
         'xcb-util' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-image')
provides=('x-choyce')
conflicts=('x-choyce')
source=("https://github.com/jrk-/x-choyce/archive/2013.12.13.tar.gz")

build() {
	cd "$srcdir/x-choyce-2013.12.13"
	make
}

package() {
	cd "$srcdir/x-choyce-2013.12.13"
	install -D -m644 "$srcdir/x-choyce-2013.12.13/LICENSE" \
	                 "$pkgdir/usr/share/licenses/x:choyce/LICENSE"
	make install PREFIX=$pkgdir/usr
}
md5sums=('3b06181d27195724977da052f8fb9ecb')
