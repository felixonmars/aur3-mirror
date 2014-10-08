# Maintainer: Martynas Januskauskas <martynas@januskauskas.eu>
pkgname=fgx-git
pkgver=20141007
pkgrel=1
pkgdesc="Launcher for free and open source FlightGear Flight Simulator, based on Qt (gitorious)"
arch=('x86_64' 'i686')
license=('GPL')
depends=()
makedepends=('git' 'qt4')
replaces=('fgx')
provides=('fgx')
conflicts=('fgx')
url="https://gitorious.org/fgx"
options=('strip')
source=('fgx.png' 
		'fgx.desktop')
sha512sums=('c5c4ef240a18a4f162ae55ce5669ca82f0b8a869d696f6c873da880dc0f52c8b44c97651813aa2d6b07279d56ad784f4ae94eb1627d607e2c5d5515cc66011de'
            '62a1eb33307fb641d9ec24f161a29b994e6398f1cf41728fd5f937140f76969b9db39f508ae27a5864e7d3b20578a4bc6c80368927f06d79bba1be5a766c5902')
_gitroot=git://gitorious.org/fgx/fgx.git
_gitname=fgx

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	#
	# BUILD HERE
	#
	cd $srcdir/fgx/src
	qmake-qt4 && make
}

package() {
	install -m655 -D "${srcdir}/fgx/src/fgx" "${pkgdir}/usr/bin/fgx"
	install -m644 -D "${srcdir}/fgx.png" "${pkgdir}/usr/share/pixmaps/fgx.png"
	install -m644 -D "${srcdir}/fgx.desktop" "${pkgdir}/usr/share/applications/fgx.desktop"
}
