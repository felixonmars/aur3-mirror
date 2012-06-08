# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=kate-plugin-neznaju-git
pkgver=20120608
pkgrel=1
pkgdesc="Kate plugin for collaborative editing"
arch=(i686 x86_64)
url="https://github.com/Kakadu/Neznaju"
license=('GPL')
depends=('kdesdk-kate')
makedepends=('git' 'cmake')

_gitroot="git://github.com/Kakadu/Neznaju.git"
_gitname="neznaju"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	install -Dm0755 DESCRIPTION.txt "$pkgdir/usr/share/docs/$pkgname/DESCRIPTION.txt"
	make DESTDIR="$pkgdir/" install
}
