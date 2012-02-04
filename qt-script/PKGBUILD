# $Id: PKGBUILD 29693 2009-03-11 18:46:59Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=qt-script
pkgver=4.5.0
pkgrel=3
_qtcopyver=936035
pkgdesc='The ECMAScript module for the Qt toolkit'
arch=('i686' 'x86_64')
url='http://www.qtsoftware.com/'
license=('GPL3' 'LGPL')
depends=('libpng' 'mesa' 'fontconfig' 'libtiff' 'libmng' 'sqlite3' 'libxrandr' 'glib2' 'libxi' 'dbus' 'libxcursor' 'libxinerama' 'libxrender')
optdepends=('postgresql-libs' 'libmysqlclient' 'unixodbc')
makedepends=('inputproto' 'postgresql-libs' 'mysql' 'unixodbc' 'cups' 'libxfixes')
provides=("qt-script" "qtscriptgenerator")
options=('!libtool')
_pkgfqn="qt-x11-opensource-src-${pkgver}"
# svn export -r${_qtcopyver} svn://anonsvn.kde.org/home/kde/trunk/qt-copy/patches/ qt-copy-patches-${_qtcopyver}
source=("ftp://ftp.qtsoftware.com/qt/source/${_pkgfqn}.tar.bz2")
md5sums=()
build() {
	unset QMAKESPEC
	export QT4DIR=$srcdir/$_pkgfqn
	export PATH=${QT4DIR}/bin:${PATH}
	export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}

	cd $srcdir/$_pkgfqn

	./configure -confirm-license \
		-silent \
		-prefix /usr \
		-sysconfdir /etc \
		-plugindir /usr/lib/qt/plugins \
		-translationdir /usr/share/qt/translations \
		-datadir /usr/share/qt \
		-docdir /usr/share/doc/qt \
		-examplesdir /usr/share/doc/qt/examples \
		-demosdir /usr/share/doc/qt/demos \
		-no-separate-debug-info \
		-plugin-sql-{psql,mysql,sqlite,odbc} \
		-system-sqlite \
		-openssl-linked \
		-nomake demos \
		-nomake examples \
		-nomake docs \
		-no-phonon \
		-optimized-qmake \
		-reduce-relocations \
		-no-exceptions \
		-no-xkb \
		-no-fontconfig \
		-no-xrender \
		-no-xrandr \
		-no-xfixes \
		-no-xcursor \
		-no-xinerama \
		-no-xshape \
		-no-sm \
		-no-opengl \
		-no-nas-sound \
		-no-dbus \
		-no-cups \
		-no-nis \
		-no-gif \
		-no-libpng \
		-no-libmng \
		-no-libjpeg \
		-no-openssl \
		-system-zlib \
		-no-webkit \
		-no-phonon \
		-no-qt3support \
		-no-xmlpatterns \
		-no-freetype \
		-no-libtiff \
		-no-accessibility \
		-no-fontconfig \
		-no-glib \
		-no-opengl \
		-no-svg \
		-no-gtkstyle	|| return 1

	make || return 1
	make INSTALL_ROOT=$pkgdir install || return 1
	
	# cleanup and path fixes
	find $pkgdir/usr/lib -type f -name '*prl' -print -exec sed -i -e "/^QMAKE_PRL_BUILD_DIR/d" {} \;
	sed -i -e "s|-L$srcdir/${_pkgfqn}/lib||g" $pkgdir/usr/lib/pkgconfig/*.pc
	sed -i -e "s|$srcdir/${_pkgfqn}/bin/moc|/usr/bin/moc|g" $pkgdir/usr/lib/pkgconfig/*.pc
	sed -i -e "s|$srcdir/${_pkgfqn}/bin/uic|/usr/bin/uic|g" $pkgdir/usr/lib/pkgconfig/*.pc
}
