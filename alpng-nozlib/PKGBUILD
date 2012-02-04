# Contributor: Micael Soder <zoulnix|at|gmail|dot|com>
# Maintainer: Dany Martineau <dany.luc.martineau gmail com>

pkgname=alpng-nozlib
pkgver=1.3
pkgrel=2
pkgdesc="Library for loading PNG files for the Allegro library.  Without zlib linking."
arch=('i686' 'x86_64')
url="http://alpng.sourceforge.net/"
license=('GPL')
depends=('allegro')
makedepends=('gcc' 'make' 'pkgconfig')
source=(http://downloads.sourceforge.net/alpng/alpng13.tar.gz)
md5sums=('e1e4cf2771663a43c065e04ce5f4efd9')
provides=('alpng')
conflicts=('alpng')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/{lib,include}

  ./configure
  make || return 1

  install -m644 libalpng.a ${pkgdir}/usr/lib/ || return 1
  install -m644 src/alpng.h ${pkgdir}/usr/include/ || return 1
}