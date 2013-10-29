# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=dolphin-box-plugin-git
pkgver=1.e7578ac
pkgrel=1
pkgdesc="Dropbox integration for the dolphin file manager"
arch=('i686' 'x86_64')
url="http://trichard-kde.blogspot.com/2010/12/introducing-dropbox-integration-for.html"
license=('GPL')
depends=('kdebase-dolphin' 'dropbox')
makedepends=('git' 'cmake' 'automoc4')

provides=(dolphin-box-plugin)
conflicts=(dolphin-box-plugin)

source=('git://anongit.kde.org/scratch/trichard/dolphin-box-plugin')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/dolphin-box-plugin"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "$srcdir/dolphin-box-plugin"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$srcdir/dolphin-box-plugin"
	make DESTDIR="$pkgdir/" install
}
