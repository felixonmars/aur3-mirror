
pkgname=qt-psql
pkgver=4.4.1
pkgrel=1
pkgdesc="The QPSQL7 - PostgreSQL v6.x and v7.x Driver"
arch=('i686')
url="http://www.trolltech.com/products/qt"
license=('GPL3')
options=('!libtool')
depends=('qt=4.4.1')
makedepends=('postgresql')
_pkgfqn=qt-x11-opensource-src-$pkgver
# svn export svn://anonsvn.kde.org/home/kde/trunk/qt-copy/patches/ qt-copy-patches
source=("ftp://ftp.trolltech.com/qt/source/${_pkgfqn}.tar.gz")
md5sums=('b09decad252b5181f300135e3122481d')

build() {
	unset QMAKESPEC
	export QT4DIR=$srcdir/$_pkgfqn
	export PATH=${QT4DIR}/bin:${PATH}
	export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}

	cd $srcdir/${_pkgfqn}/src/plugins/sqldrivers/psql	
	
	#qmake -o Makefile "INCLUDEPATH+=/usr/include/postgresql/" "LIBS+=-L/usr/lib -lpq" psql.pro || return 1
	qmake -o Makefile "INCLUDEPATH+=/usr/include/libpq++/" "LIBS+=-L/usr/lib -lpq" psql.pro || return 1
	make || return 1
	make INSTALL_ROOT=$pkgdir install || return 1

	# lots of cleanup and path fixes - thanks to crazy (frugalware)
	find $pkgdir/usr/lib -type f -name '*prl' -print -exec sed -i -e "/^QMAKE_PRL_BUILD_DIR/d" {} \;
}
