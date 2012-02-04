# Contributor: Tobias Sandmann <tSa *at* gmx *dot* eu>

pkgname=minos-mico
pkgver=1.8
pkgrel=1
pkgdesc="Minos is a lightweight, portable implementation of the OMG CORBA Notification Service written in C++."
arch=(i686)
url="http://minosrv.sourceforge.net/"
license=('GPL')
depends=('mico>=2.3.12')
makedepends=('sed')
install=
source=(http://downloads.sourceforge.net/minosrv/minos-$pkgver.tar.gz
        minos-$pkgver.patch)
md5sums=('44f2ee92b3d7f174c8d32dbaffd8f2de'
         'bbbc466c34346f6ce1e6f0a3c2d31655')

build() {
  cd $startdir/src/minos
  patch -p1 <$startdir/src/minos-$pkgver.patch
  _mico_libs=`mico-config --libs |sed -e "s/.*\(-lmico[0-9\.]\+\)[ ]*\(-lssl\)*.*/\1 \2/g"`
  sed -e "s/-lmico2\.3\.12/${_mico_libs}/g" -i Minos/gcc/mico/Makefile
  cd $startdir/src/minos/gcc
  make ORB=mico MICO_ROOT=/usr || return 1
  install -d $startdir/pkg/usr/bin
  install -t $startdir/pkg/usr/bin $startdir/src/minos/gcc/bin/Minos_mico
  install -d $startdir/pkg/usr/share/doc/$pkgname
  install -t $startdir/pkg/usr/share/doc/$pkgname $startdir/src/minos/README.unix
  install -t $startdir/pkg/usr/share/doc/$pkgname $startdir/src/minos/gcc/run_minos_mico
}

