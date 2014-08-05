pkgname=ggcov
pkgver=0.9
pkgrel=1
pkgdesc="ggcov is a GTK+ GUI for exploring test coverage data produced by C and C++ programs compiled with gcc -fprofile-arcs -ftest-coverage."
arch=('i686' 'x86_64')
url="http://ggcov.sourceforge.net/"
license=('GPL2')
depends=('libglade' 'libgnomeui')
source=(http://sourceforge.net/projects/ggcov/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('e1510c0e77f81e1dcf6bfb6276e10f63')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
