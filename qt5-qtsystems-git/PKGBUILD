# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=qt5-qtsystems-git
_gitname=qtsystems
pkgver=20130408
pkgrel=1
pkgdesc="Qt 5: qtsystems module for official qt5 extra repo"
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt/qtsystems"
license=('LGPL')
depends=('qt5-base')
makedepends=('git' 'qt5-base')
options=('!libtool')
source=('git://gitorious.org/qt/qtsystems.git')
sha1sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
	cd "${_gitname}"
	qmake
	make
}

package() {
	cd "${_gitname}"
	make INSTALL_ROOT="${pkgdir}" install
}