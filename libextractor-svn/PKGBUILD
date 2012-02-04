pkgname=libextractor-svn
pkgver=13061
pkgrel=1
pkgdesc="A simple library for keyword extraction (SVN Version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/libextractor/"
depends=('libtool>=2.2')
makedepends=('subversion' 'autoconf>=2.59' 'automake>=1.11.1' 'm4')
optdepends=()
provides=('libextractor')
conflicts=('libextractor')
source=()
md5sums=()
_svntrunk=https://ng.gnunet.org/svn/Extractor/
_svnmod=libextractor-svn

build() {
  svn co $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting build..."
     cd ${srcdir}/$_svnmod
  ./bootstrap
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  rm -rf ${srcdir}/$_svnmod
}
