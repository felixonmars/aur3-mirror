# Maintainer: Andrew Mellor <quantumphazor@gmail.com>
pkgname=invgrid
pkgver=20110320
pkgrel=1
pkgdesc="A simple inventory editor for Minecraft. Beta based maps only."
arch=('i686' 'x86_64')
url="http://github.com/jbendig/InvGrid"
license=('Public Domain')
depends=('qt' 'boost' 'zlib' 'lua')
makedepends=('git' 'cmake')
source=()
md5sums=()

_gitname="invgrid"
_gitroot="git://github.com/jbendig/InvGrid.git"

build() {
	cd $srcdir
	msg "Connecting to GIT server..."
	if [[ -d $_gitname ]]; then
		(cd $_gitname && git pull origin)
	else
		git clone $_gitroot $_gitname
	fi
	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build

	cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1
	make || return 1
	make DESTDIR=$pkgdir install
}
