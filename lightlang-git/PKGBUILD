# Contributor : eduard_pustobaev <eduard_pustobaev@mail.ru>

pkgname=lightlang-git
pkgver=20110910
pkgrel=1
pkgdesc="LightLang - system of electronic dictionaries for Linux."
arch=('i686' 'x86_64')
url="http://code.google.com/p/lightlang"
license="GPL"
depends=('qt' 'pyqt' 'python2-pyqt' 'python-xlib' 'sox')
makedepends=('git' 'autoconf')
provides=('lightlang')
replaces=('lightlang-svn')
source=()
md5sums=()

_gitroot="git://github.com/mdevaev/lightlang.git"
_gitname="lightlang"


build() {
	cd $startdir/src
	if [ -d $_gitname ]; then
		msg "Updateing local repository..."
		cd $_gitname
		git pull origin master || return 1
		msg "The local files are updated."
		cd ..
	else
		git clone $_gitroot --depth=1
	fi

	msg "Git clone done or server timeout"
	msg "Starting make..."

	rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build

	autoconf
	./configure --with-python=python2 || return 1
	make || return 1
	make DESTDIR=$pkgdir install
}

