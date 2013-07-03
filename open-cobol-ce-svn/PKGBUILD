# Maintainer: Deon Spengler <deon.spengler@gmail.com>
pkgname=open-cobol-ce-svn
_pkgname=open-cobol-ce
pkgver=20130624.1212
pkgrel=1
pkgdesc="An open-source COBOL compiler"
arch=(armv6h i686 x86_64)
url="http://sourceforge.net/projects/open-cobol/"
license=('GPL')
makedepends=('subversion')
depends=('db' 'gmp')
provides=('open-cobol')                                                
conflicts=('open-cobol')
options=('!libtool')
source=("${_pkgname}::svn+http://svn.code.sf.net/p/open-cobol/code/trunk")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"
  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
