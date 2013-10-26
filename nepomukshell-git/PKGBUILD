# Contributor: Michal Malek <michalm@jabster.pl>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=nepomukshell-git
epoch=1
pkgver=196.473aec8
pkgrel=1
pkgdesc="Allows to browse, query, and edit Nepomuk resources"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/sdk/nepomukshell"
license=('GPL3')
depends=(kdelibs)
makedepends=(git cmake automoc4)
provides=(nepomukshell)
conflicts=(nepomukshell)

source=("git://anongit.kde.org/nepomukshell")
md5sums=('SKIP')

pkgver() {
	cd nepomukshell

	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd nepomukshell

	cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
	make
}

package() {
	cd nepomukshell

	make DESTDIR="${pkgdir}" install
}
