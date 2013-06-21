# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-vibe-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Hawaii: Vibe libraries"
arch=('i686' 'x86_64')
url="http://www.maui-project.org"
license=('LGPL')
depends=('kde-solid-git' 'qt5-tools-git' 'cantarell-fonts')
makedepends=('git' 'cmake' 'qt5-declarative-git')

_gitroot="git://github.com/hawaii-desktop/vibe.git"
_gitbranch=master
_gitname=vibe
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd ${srcdir}/${_gitname}

	export PATH=/opt/hawaiide/bin:$PATH
	export PKG_CONFIG_PATH=/opt/hawaiide/lib/pkgconfig

	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_INSTALL_DATADIR=/usr/share/hawaii \
		-DCMAKE_INSTALL_PLUGINSDIR=/usr/lib/hawaii/plugins \
		-DCMAKE_INSTALL_QMLDIR=/usr/lib/hawaii/qml \
		-DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd ${srcdir}/${_gitname}/build
	make DESTDIR="${pkgdir}" install

	mkdir -p $pkgdir/etc/profile.d
	cat >$pkgdir/etc/profile.d/hawaii.sh <<EOF
export QT_MESSAGE_PATTERN='%{appname}(%{pid})/%{category} %{function}: %{message}'
export QT_PLUGIN_PATH=/usr/lib/hawaii/plugins:\$QT_PLUGIN_PATH
export QML2_IMPORT_PATH=/usr/lib/hawaii/qml:\$QML2_IMPORT_PATH
export XDG_DATA_DIRS=/usr/share/hawaii:\$XDG_DATA_DIRS
export LD_LIBRARY_PATH=/opt/hawaiide/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/opt/hawaiide/lib/pkgconfig:$PKG_CONFIG_PATH
EOF
	chmod 755 $pkgdir/etc/profile.d/hawaii.sh
}
