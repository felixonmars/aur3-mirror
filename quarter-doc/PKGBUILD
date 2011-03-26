# Contributor: mickele <mimocciola@yahoo.com>
pkgname=quarter-doc
pkgver=1.0.0
pkgrel=3
pkgdesc="HTML Documentation of Quarter library"
arch=('i686' 'x86_64')
url="http://www.coin3d.org/lib/quarter"
license=('GPL')
depends=()
makedepends=('make' 'gcc' 'doxygen' 'qt>=4.0' 'coin>=3.0.0' 'sed')
conflicts=('quarter-svn-doc')
options=('docs')
source=(http://ftp.coin3d.org/coin/src/all/Quarter-$pkgver.tar.gz)

build() {
  _pkgdoc=quarter
  
  cd ${srcdir}
  sed -e "s/#include <Inventor\/SoInteraction.h>/#include <Inventor\/SoInteraction.h>\n#include <cstdio>/" \
      -i ${srcdir}/Quarter-${pkgver}/src/Quarter/Quarter.cpp
  mkdir -p build
  cd build
  ../Quarter-${pkgver}/configure --prefix=/usr --enable-html || return 1

  make || return 1

  make DESTDIR=$startdir/pkg install || return 1

  # Removes unnecessary dirs
  rm -rf ${startdir}/pkg/usr/include
  rm -rf ${startdir}/pkg/usr/lib

  # Install html-doc in right place
  install -d ${pkgdir}/usr/share/doc/${_pkgdoc}/html || return 1
  install -D -m 644 ${pkgdir}/usr/share/Quarter/html/* ${startdir}/pkg/usr/share/doc/${_pkgdoc}/html || return 1
#  rm -rf ${pkgdir}/usr/share/Quarter


  #Install examples
  install -d ${pkgdir}/usr/share/doc/${_pkgdoc}/examples || return 1
  # Next line is necessary if user want to launch examples in their original location
  install -d -m 777 ${pkgdir}/usr/share/doc/${_pkgdoc}/examples/.libs || return 1
  install -D -m 644 ${srcdir}/Quarter-${pkgver}/src/examples/*.{h,cpp,ui} ${pkgdir}/usr/share/doc/${_pkgdoc}/examples || return 1
  for _FILE in directui dynamicui examiner inheritui mdi minimal superimposition
  do
    install -D -m 755 ${srcdir}/build/src/examples/$_FILE ${pkgdir}/usr/share/doc/${_pkgdoc}/examples || return 1
  done
}
md5sums=('73d7c9e1917436e29b128781c997185f')
