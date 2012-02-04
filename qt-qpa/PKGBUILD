# $Id$
# Maintainer: Janusz Lewandowski <lew21@xtreeme.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=qt-qpa
pkgname=('qt-qpa' 'qt-qpa-private-headers')
pkgver=20110828
pkgrel=1
arch=('i686' 'x86_64')
url='http://qt.nokia.com/'
license=('GPL3' 'LGPL')
makedepends=('glib2' 'libgles' 'libegl' 'zlib' 'pcre' 'dbus' 'ca-certificates' 'libtiff' 'libpng' 'libmng'
             'fontconfig' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils'
             'cups' 'gtk2' 'icu' 'alsa-lib' 'pulseaudio' 'libwayland-git'
             'postgresql-libs' 'mysql' 'sqlite3' 'unixodbc')
options=('!libtool')

_gitroot="git://gitorious.org/qt/qt.git"
_gitname="qt"
_pkgfqn="$_gitname-build"

build() {
	unset QMAKESPEC
	export QT4DIR=$srcdir/$_pkgfqn
	export PATH=${QT4DIR}/bin:${PATH}
	export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}

	msg "Connecting to the GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname
		git pull origin
		cd ..
	else
		git clone $_gitroot
	fi

	msg "Creating build directory..."
	rm -rf $_gitname-build
	cp -rH $_gitname $_gitname-build

	msg "Starting build..."
	cd $_gitname-build

	sed -i "s|-O2|$CXXFLAGS|" mkspecs/common/g++.conf
	sed -i "/^QMAKE_RPATH/s| -Wl,-rpath,||g" mkspecs/common/g++.conf
	sed -i "/^QMAKE_LFLAGS\s/s|+=|+= $LDFLAGS|g" mkspecs/common/g++.conf

	export QT_WAYLAND_GL_CONFIG=wayland_egl

	./configure -confirm-license -opensource \
		-prefix /opt/qt-qpa \
		-docdir /opt/qt-qpa/share/doc/qt \
		-plugindir /opt/qt-qpa/lib/qt/plugins \
		-importdir /opt/qt-qpa/lib/qt/imports \
		-datadir /opt/qt-qpa/share/qt \
		-translationdir /opt/qt-qpa/share/qt/translations \
		-sysconfdir /opt/qt-qpa/etc \
		-examplesdir /opt/qt-qpa/share/doc/qt/examples \
		-demosdir /opt/qt-qpa/share/doc/qt/demos \
		-largefile \
		-plugin-sql-{psql,mysql,sqlite,odbc} \
		-system-sqlite \
		-xmlpatterns \
		-no-qt3support \
		-no-phonon \
		-no-phonon-backend \
		-qpa \
		-svg \
		-no-webkit \
		-script \
		-scripttools \
		-system-zlib \
		-system-libtiff \
		-system-libpng \
		-system-libmng \
		-system-libjpeg \
		-nomake demos \
		-nomake examples \
		-nomake docs \
		-no-rpath \
		-openssl-linked \
		-silent \
		-optimized-qmake \
		-dbus \
		-reduce-relocations \
		-no-separate-debug-info \
		-gtkstyle \
		-opengl es2 \
		-no-openvg \
		-glib

	make -j3
}

package_qt-qpa() {
	pkgdesc='A cross-platform application and UI framework'
	depends=('glib2' 'libgles' 'libegl' 'zlib' 'pcre' 'dbus' 'ca-certificates' 'libtiff' 'libpng' 'libmng'
	         'fontconfig' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils'
	         'alsa-lib')
	optdepends=(
		'sqlite3: SQLite3 driver'
		'postgresql-libs: PostgreSQL driver'
		'libmysqlclient: MySQL driver'
		'unixodbc: ODBC driver')
	install='qt.install'

	cd $_pkgfqn
	make INSTALL_ROOT=$pkgdir install

	# install license addition
	install -D -m644 LGPL_EXCEPTION.txt ${pkgdir}/opt/qt-qpa/share/licenses/qt/LGPL_EXCEPTION.txt

	# Fix wrong path in pkgconfig files
	find ${pkgdir}/opt/qt-qpa/lib/pkgconfig -type f -name '*.pc' \
		-exec perl -pi -e "s, -L${srcdir}/?\S+,,g" {} \;
	# Fix wrong path in prl files
	find ${pkgdir}/opt/qt-qpa/lib -type f -name '*.prl' \
		-exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;
}

package_qt-qpa-private-headers(){
	pkgdesc="Qt private headers for development"
	depends=("qt-qpa=${pkgver}")

	cd $_pkgfqn/include

	for i in *
	do
		if [ -d $i/private ]
		then
			install -d ${pkgdir}/opt/qt-qpa/include/${i}/
			cp -R ${i}/private ${pkgdir}/opt/qt-qpa/include/${i}/
		fi
	done
}

# For AUR!
pkgname=qt-qpa
pkgdesc='A cross-platform application and UI framework.'
