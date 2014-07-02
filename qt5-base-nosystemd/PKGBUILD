# Maintainer: Mateusz Karwowski <sekstus.empiryk@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_pkgname=qtbase-opensource-src-5.3.0
pkgname=qt5-base-nosystemd
pkgver=5.3.1
pkgrel=1
pkgdesc="A cross-platform application and UI framework. If you don't use systemd you need only to compile this package instead of whole qt5."
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=(
	"dbus" "xcb-util-keysyms" "xcb-util-wm" "xcb-util-image"
	"libxext" "inputproto" "libgl" "libxkbcommon" "systemd"
	"libpng" "sqlite" "fontconfig" "icu" "libxrender"
)
makedepends=("git" "postgresql-libs")
optdepends=(
	"qtchooser: set the default Qt toolkit"
	"postgresql-libs: PostgreSQL driver"
	"libmariadbclient: MariaDB driver"
	"unixodbc: ODBC driver"
	"libfbclient: Firebird/iBase driver"
)
provides=("qt5-base")
conflicts=("qt5-base")
source=("http://download.qt-project.org/official_releases/qt/5.3/5.3.1/submodules/qtbase-opensource-src-5.3.1.tar.gz")
sha256sums=('08963bbfa8a75faf4b938d4334306ccf84d0c82fc6a113cad9952506228b1725')

prepare() {
	cd "$srcdir/qtbase-opensource-src-5.3.1"
	sed -i "s|-O2|${CXXFLAGS}|" mkspecs/common/{g++,gcc}-base.conf
	sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" "mkspecs/common/gcc-base-unix.conf"
	sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS}|g" "mkspecs/common/gcc-base.conf"
}

build() {
	cd "$srcdir/qtbase-opensource-src-5.3.1"

	./configure -confirm-license -opensource \
		-prefix /usr \
		-bindir /usr/lib/qt/bin \
		-docdir /usr/share/doc/qt \
		-headerdir /usr/include/qt \
		-archdatadir /usr/lib/qt \
		-datadir /usr/share/qt \
		-sysconfdir /etc/xdg \
		-examplesdir /usr/share/doc/qt/examples \
		-system-sqlite \
		-openssl-linked \
		-nomake examples \
		-nomake tests \
		-no-rpath \
		-optimized-qmake \
		-dbus-linked \
		-reduce-relocations \
		-opengl es2
	make
}

package() {
	cd "$srcdir/qtbase-opensource-src-5.3.1"
	make INSTALL_ROOT="$pkgdir" install
}
