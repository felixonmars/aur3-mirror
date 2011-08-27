# Contributor: Andreas Schmidl <Andreas.Schmidl@gmail.com>

pkgname=drop2imageshack-plasmoid
pkgver=0.5.2
pkgrel=1
pkgdesc="This is a KDE 4 plasma applet which can copy images to the imageshack web service. It copies the generated URL to clipboard"
arch=('i686' 'x86_64')
url="http://github.com/holycheater/plasma-widget-drop2imageshack"
license=('GPLv2')
groups=()
depends=('kdebase-workspace>=4.2')
makedepends=('gcc' 'cmake' 'automoc4')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://cloud.github.com/downloads/holycheater/plasma-widget-drop2imageshack/plasma-widget-drop2imageshack_$pkgver.orig.tar.gz")
noextract=()
md5sums=('a00054f2378a5df2783d028717f317e4')
build() {
	cd $srcdir/plasma-widget-drop2imageshack-$pkgver

	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
	make VERBOSE=1 || return 1
	make DESTDIR=$pkgdir install || return 1

}
