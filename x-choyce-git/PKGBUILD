# Maintainer: SanskritFritz (gmail)

pkgname=x-choyce-git
_gitname="x-choyce"
pkgver=2013.12.18
pkgrel=1
pkgdesc="A light-weight, Exposé-like window switcher for X (feat. OpenGL)."
arch=('i686' 'x86_64')
url="https://github.com/jrk-/x-choyce"
license=("BSD")
depends=('mesa' 'libxcb' 'libx11' 'libxrender' 'libxft' 'xcb-util' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-image')
provides=('x-choyce')
conflicts=('x-choyce')
source=("git://github.com/jrk-/x-choyce.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
	make
}

package() {
	cd "$srcdir/$_gitname"
	mkdir --parents "$pkgdir/usr/bin"
	cp src/x:choyce "$pkgdir/usr/bin"
}
