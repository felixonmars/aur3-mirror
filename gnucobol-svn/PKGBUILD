# Maintainer: Deon Spengler <deon.spengler@gmail.com>
pkgname=gnucobol-svn
_pkgname=gnu-cobol
pkgver=r119
pkgrel=1
pkgdesc="GNU Cobol is a free, modern COBOL compiler"
arch=(armv6h i686 x86_64)
url="http://sourceforge.net/projects/open-cobol/"
license=('GPL')
makedepends=('subversion')
depends=('db' 'gmp')
provides=('gnucobol')
conflicts=('open-cobol')
options=('!libtool')
source=("$_pkgname::svn+http://svn.code.sf.net/p/open-cobol/code/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_pkgname/$_pkgname"
  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "$srcdir/$_pkgname/$_pkgname"
  make DESTDIR="$pkgdir" install
}
