pkgname=ekbd-svn
_pkgname=ekbd
pkgver=84545
pkgrel=1
pkgdesc="A vkbd (virtual keyboard) library using EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('evas' 'eina' 'ecore' 'edje' 'elementary' 'libx11')
makedepends=('subversion')
options=('!libtool')
source=('svn+http://svn.enlightenment.org/svn/e/trunk/PROTO/ekbd')
md5sums=('SKIP')

pkgver() {
  cd ${startdir}/${_pkgname}
  svnversion | tr -d [A-z]
}

build() {
  cd ${srcdir}/${_pkgname}

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}

  make DESTDIR=${pkgdir} install
  
  # install license files
  install -Dm644 ${srcdir}/${_pkgname}/COPYING \
  	${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
