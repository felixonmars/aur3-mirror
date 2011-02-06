# Contributor: sauron <sauron@citadelspb.com>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
pkgname=qt-opt-git
pkgver=20100525
pkgrel=1
pkgdesc="The QT gui toolkit. Qt from git, branch 4.6-stable. Installs in /opt"
arch=('i686' 'x86_64')
url="http://www.qt.gitorious.org/"
license=('LGPL')
options=('!libtool' '!docs')
depends=('libpng' 'libxi' 'mesa' 'fontconfig' 'libxrandr' 'glib2' 'libtiff' 'libmng' 'sqlite3' 'dbus' 'libxcursor' 'libxinerama')
optdepends=('postgresql-libs' 'libmysqlclient' 'unixodbc')
makedepends=('inputproto' 'postgresql-libs' 'mysql' 'unixodbc' 'libxfixes')
provides=()
replaces=()
conflicts=()
_gitroot="git://gitorious.org/qt/qt.git"
_gitname="qt"
# install=qt-git.install

build() {
	msg "Connecting to gitorious GIT server...."

	if [ -d ${srcdir}/qt ] ; then
		cd qt
		#Comment next cmd if you modify the source
		git reset --hard
		git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi
	unset QMAKESPEC
	export QT4DIR=$srcdir/qt
	export PATH=${QT4DIR}/bin:${PATH}
	export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}

	cd $srcdir/qt

	sed -i 's|-cp -P -f|-cp -L -f|' qmake/Makefile.unix
	sed -i "s|-O2|$CXXFLAGS|" mkspecs/common/g++.conf
	# fix postgres build
	sed -e '/pg_config --libs/d' -i configure
	# do not compile demos, examples and docs
	# sed -i 's|CFG_NOBUILD_PARTS=""|CFG_NOBUILD_PARTS="demos examples docs"|' configure

	./configure  -confirm-license \
		-make libs \
		-make tools \
		-prefix /opt/qt-git \
		-no-exceptions \
		-plugin-sql-{psql,mysql,sqlite,odbc} \
		-system-sqlite \
		-phonon \
		-qvfb \
		-no-qt3support \
		-dbus \
		-webkit \
		-system-libpng \
		-system-libjpeg \
		-system-zlib \
		-openssl \
		-cups \
		-reduce-relocations \
		-iconv \
		-xinerama \
		-xcursor \
		-xfixes \
		-graphicssystem raster \
		-optimized-qmake \
		-opengl|| return 1

	make || return 1
	make INSTALL_ROOT=$pkgdir install || return 1
}
md5sums=('')
