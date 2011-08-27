pkgname=gnunet-svn
pkgver=1
pkgrel=1
pkgdesc="A framework for secure peer-to-peer networking (SVN Version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnunet.org"
depends=('libextractor-svn' 'libmicrohttpd-svn' 'libgcrypt>=1.2'
         'gmp>=4.0' 'curl>=7.21.0' 'libtool>=2.2' 'sqlite3')
makedepends=('subversion' 'autoconf>=2.59' 'automake>=1.11.1' 'm4')
optdepends=()
provides=('gnunet')
conflicts=('gnunet')
source=()
md5sums=()
_svntrunk=https://ng.gnunet.org/svn/gnunet/
_svnmod=gnunet-svn

build() {
  svn co $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting build..."
     cd ${srcdir}/$_svnmod
  ./bootstrap
  ./configure --prefix=/usr || return 1
  make -j1 || return 1
  make DESTDIR="$pkgdir" install || return 1
  rm -rf ${srcdir}/$_svnmod
}
