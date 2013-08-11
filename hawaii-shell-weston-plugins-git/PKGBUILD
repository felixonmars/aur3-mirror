# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-shell-weston-plugins-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Hawaii Shell plugins for Weston"
arch=('i686' 'x86_64')
url="http://www.maui-project.org"
license=('GPL', 'LGPL')
depends=('weston' 'hawaii-shell-git')
makedepends=('git')

_gitroot="git://github.com/hawaii-desktop/shell-weston-plugins.git"
_gitbranch=master
_gitname=shell-weston-plugins
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${_gitname}
	git describe --always | sed 's|-|.|g'
}

prepare() {
	mkdir build
}

build() {
	cd build
	../${_gitname}/autogen.sh --prefix=/opt/hawaii-git
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install

	mkdir -p $pkgdir/usr/lib/weston
	cd $pkgdir/usr/lib/weston
	ln -s /opt/hawaii-git/lib/weston/hawaii-desktop-shell.so
}
