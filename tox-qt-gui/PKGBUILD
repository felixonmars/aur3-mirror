# Maintainer: RunningDroid <rningdrd AT tormail.net>
# Contributer: Marat "Morion" Talipov <morion.self@gmail.com>

_gitname='ProjectTox-Qt-GUI'
pkgname=tox-qt-gui
pkgver=62.f288054
pkgver() {
    cd "$_gitname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
pkgrel=2
pkgdesc="FOSS instant messaging application aimed to replace Skype (GUI)"
arch=('i686' 'x86_64')
url="http://tox.im"
license=('GPLv3')
depends=('ncurses' 'libsodium' 'qt5-base')
makedepends=('git' 'make')
source=('git+https://github.com/nurupo/ProjectTox-Qt-GUI.git')
md5sums=('SKIP')

build() {
	cd "$_gitname"

    git submodule update --init --recursive

	if [[ -d build ]]; then
		rm -rf build
	fi

	mkdir build && cd build
	msg "Building ..." 
	qmake-qt5 -Wall ../projectfiles/QtCreator/TOX-Qt-GUI.pro
	make
	msg "Done"
}

package() {
	cd "$_gitname"

	#dir
	install -dm 755 $pkgdir/usr/bin

	#bin file
	install -m 755 ./build/TOX-Qt-GUI $pkgdir/usr/bin/tox-qt-gui
		 
	msg "Removing build directory ..."
	rm -rf build
	msg "Done"
}
