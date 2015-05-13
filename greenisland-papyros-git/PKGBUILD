# Maintainer: Riley Trautman <asonix.dev@gmail.com>

_pkgname=greenisland-papyros
pkgname=$_pkgname-git
provides=("$_pkgname" "greenisland")
conflicts=("$_pkgname" "greenisland")
replaces=("$_pkgname" "greenisland")
pkgver=5f603c66
pkgrel=1
pkgdesc="A temporary development fork of GreenIsland (will be replaced by main GreenIsland branch after feature merge)"
arch=("any")
url="https://github.com/papyros/greenisland"
license=("GPL")
depends=("qt5-declarative-git" "hawaii-qt5-wayland-git")
makedepends=("git" "gdb" "extra-cmake-modules")
source=("$_pkgname::git+https://github.com/papyros/greenisland.git")
sha256sums=("SKIP")

prepare() {
	mkdir -p build
  pushd "$srcdir/$_pkgname"
  git checkout feature/window_manager
  popd
}

build() {
  cd build
  cmake ../$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DQML_INSTALL_DIR=lib/qt/qml \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DQtWaylandScanner_EXECUTABLE=/usr/lib/qt/bin/qtwaylandscanner \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
