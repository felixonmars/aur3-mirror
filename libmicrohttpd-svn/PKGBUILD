pkgname=libmicrohttpd-svn
pkgver=1
pkgrel=1
pkgdesc="Provides a compact API and implementation of an HTTP 1.1 web server (SVN Version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/libmicrohttpd/"
depends=()
makedepends=('subversion' 'autoconf>=2.59' 'automake>=1.11.1' 'm4')
optdepends=()
provides=('libmicrohttpd')
conflicts=('libmicrohttpd')
source=()
md5sums=()
_svntrunk=https://ng.gnunet.org/svn/libmicrohttpd/
_svnmod=libmicrohttpd-svn

build() {
  svn co $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting build..."
     cd ${srcdir}/$_svnmod
  /usr/bin/autoreconf -fi
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  rm -rf ${srcdir}/$_svnmod
}
