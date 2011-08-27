pkgname=baulkterm
pkgver=20090119
pkgrel=1
pkgdesc="BaulkTerm is a terminal emulator written in pure QT4 and is part of the Baulk tiling application manager."
arch=('i686' 'x86_64')
url="http://baulk.sf.net"
license=('GPL')
depends=('qt')
makedepends=('git' 'cmake>=2.6.0' 'doxygen' 'graphviz')
provides=('baulk')
conflicts=('baulk')
source=()
md5sums=()

_gitroot="git://gitorious.org/baulk/baulk.git"
_gitname="baulkTerm"

build() {
	cd $srcdir

	msg "Perusing git handles..."
	if [[ -d $_gitname ]]; then
		( cd $_gitname && git pull origin )
	else
		git clone $_gitroot $_gitname
	fi

	msg "Git tea is ready, or it spilt all over you."
	msg "Building..."

	rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build/src

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBuildBaulkTermBinary=true || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}

