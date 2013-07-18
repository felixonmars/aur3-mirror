# Maintainer: Alister.Hood (gmail)

pkgname=openbibleviewer-git
_gitname="openBibleViewer"
pkgver=2013.07.12
pkgrel=1
epoch=1
pkgdesc="Bible study tool based on QT4 and clucene"
arch=('x86_64' 'i686')
url="http://metaxy.github.io/openBibleViewer/"
license=('GPL3')
depends=('clucene' 'qtwebkit')
makedepends=('cmake' 'git')
source=("git://github.com/metaxy/openBibleViewer.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
	CXXFLAGS+=" -fpermissive"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DQT_QMAKE_EXECUTABLE=qmake-qt4 \
		-DBT_FORCE_USE_QT4=TRUE \
		"$srcdir/$_gitname"

	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}
