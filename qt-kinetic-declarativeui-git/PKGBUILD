# Contributor: sauron <sauron@citadelspb.com>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: Yuanhao Li <jay_21cn at hotmail.com> 


pkgname=qt-kinetic-declarativeui-git
pkgver=20100219
pkgrel=2
pkgdesc="The QT gui toolkit. Development project kinetic, branch declarativeui, with new animation framework, amazing declarative UI and more new features. Installs in /opt"
arch=('i686' 'x86_64')
url="http://qt.gitorious.org/+qt-kinetic-developers/qt/kinetic"
license=('LGPL')
options=('!libtool' '!docs')
depends=('libpng' 'libxi' 'mesa' 'fontconfig' 'libxrandr' 'glib2' 'libtiff' 'libmng' 'sqlite3' 'dbus' 'libxcursor' 'libxinerama')
optdepends=('postgresql-libs' 'libmysqlclient' 'unixodbc')
makedepends=('inputproto' 'postgresql-libs' 'mysql' 'unixodbc' 'libxfixes')
provides=('qt-kinetic')
replaces=()
conflicts=()
_gitroot="git://gitorious.org/+qt-kinetic-developers/qt/kinetic.git"
_gitname="kinetic-declarativeui"

build() {
	msg "Connecting to gitorious GIT server...."

	if [ -d ${srcdir}/kinetic ] ; then
		cd kinetic
		#Comment next cmd if you modify the source
		git reset --hard
		git pull origin
		git checkout origin/$_gitname
		msg "The local files are updated."
	else
		git clone $_gitroot
        cd kinetic
		git checkout origin/$_gitname
	fi
	unset QMAKESPEC
	export QT4DIR=$srcdir/kinetic
	export PATH=${QT4DIR}/bin:${PATH}
	export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}

	cd $srcdir/kinetic

	sed -i 's|-cp -P -f|-cp -L -f|' qmake/Makefile.unix
	sed -i "s|-O2|$CXXFLAGS|" mkspecs/common/g++.conf
	# fix postgres build
	sed -e '/pg_config --libs/d' -i configure
	# do not compile demos, examples and docs
	sed -i 's|CFG_NOBUILD_PARTS=""|CFG_NOBUILD_PARTS="demos examples docs"|' configure

	./configure -prefix /opt/qt-kinetic-declarativeui-git || return 1
	make || return 1
	make INSTALL_ROOT=$pkgdir install || return 1
}
md5sums=('')
