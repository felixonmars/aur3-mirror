# Maintainer: Filip Graliński <filipg@amu.edu.pl>
pkgname=morfeusz-sgjp
pkgver=20110416
pkgrel=1
pkgdesc='Morphological analyser Morfeusz SGJP for Polish'
arch=('i686' 'x86_64')
url='http://sgjp.pl/morfeusz/index.html'
license=('2-BSD')
makedepends=('make' 'gcc')
depends=('readline' 'gcc-libs')
install=
source=('http://sgjp.pl/morfeusz/download/morfeusz-SGJP-src-20110416.tar.bz2')
md5sums=('f2ab93a0df3638f0c8a198c569aa3b63')

build() {
  cd "$srcdir"

  if [[ "$CARCH" == "i686" ]]
  then
     arch=linux32
  else
     arch=linux64
  fi
  builddir=build-$arch
  if [ -d $builddir ]; then
      echo Katalog $builddir już istnieje.
  else
      mkdir $builddir
  fi

  if [ -L $builddir/Makefile ]; then
      echo Katalog $builddir zawiera już Makefile.
  else
      ln -s ../Makefile.$arch $builddir/Makefile
  fi

  make -C $builddir dist

  mkdir -p ${pkgdir}/usr/bin
  cp ${builddir}/morfeusz ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/usr/lib
  cp ${builddir}/libmorfeuszSGJP.so.0.7 ${pkgdir}/usr/lib/

  ln -s libmorfeuszSGJP.so.0.7 ${pkgdir}/usr/lib/libmorfeusz.so
  ln -s libmorfeuszSGJP.so.0.7 ${pkgdir}/usr/lib/libmorfeusz.so.0

  mkdir -p ${pkgdir}/usr/include
  cp morfeusz.h ${pkgdir}/usr/include/

  mkdir -p ${pkgdir}/usr/share/morfeusz-sgjp
  cp README CZYTAJTO ${pkgdir}/usr/share/morfeusz-sgjp/
}
