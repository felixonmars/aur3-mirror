# Maintainer: Brandon Edens <brandonedens@gmail.com>

pkgname=cppdb-svn
pkgver=2188
pkgrel=1
pkgdesc="CppDB is an SQL connectivity library that is designed to provide platform and Database independent connectivity API similarly to what JDBC, ODBC and other connectivity libraries do."
arch=('i686' 'x86_64')
url="http://cppcms.com/sql/cppdb/"
license=('LGPL')
depends=()
makedepends=('cmake' 'subversion')
source=()

_svnmod="cppdb"
_svntrunk="https://cppcms.svn.sourceforge.net/svnroot/cppcms/cppdb/trunk"

build()
{
    cd ${srcdir}

    msg "Getting sources..."
    svn co ${_svntrunk} ${_svnmod}
    msg "Done getting sources or failed to connect to server."

    rm -rf "$srcdir/cppdb-build"
    mkdir -p "$srcdir/cppdb-build"
    cd "$srcdir/cppdb-build"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/cppdb"
    make
}

package() {
	cd "$srcdir/cppdb-build"
	make DESTDIR="$pkgdir" install
}
