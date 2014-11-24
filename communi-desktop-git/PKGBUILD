# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=communi-desktop-git
pkgver=20141123.498880f
pkgrel=1
pkgdesc="Communi for desktop"
arch=('i686' 'x86_64')
url="https://github.com/communi/communi-desktop"
license=('GPL2')
conflicts=('communi-desktop')
replaces=('communi-desktop')
depends=('libcommuni-git')
makedepends=('gcc' 'git')

_gitroot="git://github.com/communi/communi-desktop.git"
_gitname=communi-desktop
_gitbranch=master
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	cd ${_gitname}
	git submodule update --init
}

build() {
	cd ${_gitname}

	qmake
	make
}

package() {
	cd ${_gitname}
	make INSTALL_ROOT="${pkgdir}" install
}
