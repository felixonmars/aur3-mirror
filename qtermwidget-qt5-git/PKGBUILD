# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: kreed <kreed@kreed.org>
# Contributor: vicky91 <vickypaiers@gmail.com>

pkgname=qtermwidget-qt5-git
pkgver=0.4.0.15.g4010729
pkgrel=1
pkgdesc="A terminal widget for Qt5"
arch=('i686' 'x86_64')
url="https://github.com/qterminal/qtermwidget"
license=('GPL2')
provides=('qtermwidget-qt5')
conflicts=('qtermwidget-qt5')
depends=('qt5-base')
makedepends=('git' 'cmake')
source=("git://github.com/qterminal/qtermwidget.git")
sha256sums=('SKIP')
_gitname="qtermwidget"

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git describe --always | sed 's/-/./g')"
}

build() {
	cd "$srcdir/$_gitname"
	# -DLIB_SUFFIX=/ prevents libraries from being installed in /usr/lib64
	cmake -DUSE_QT5=ON -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_DESIGNER_PLUGIN=0

	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}
