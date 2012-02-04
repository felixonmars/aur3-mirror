# Contributor: Tobias Sandmann <tSa *at* gmx *dot* eu>

pkgname=minos-omniorb
pkgver=1.8
pkgrel=1
pkgdesc="Minos is a lightweight, portable implementation of the OMG CORBA Notification Service written in C++."
arch=(i686)
url="http://minosrv.sourceforge.net/"
license=('GPL')
depends=('omniorb>=4.1.2' 'omniorb<5.0.0')
install=
source=(http://downloads.sourceforge.net/minosrv/minos-$pkgver.tar.gz
        minos-$pkgver.patch)
md5sums=('44f2ee92b3d7f174c8d32dbaffd8f2de'
         'bbbc466c34346f6ce1e6f0a3c2d31655')

build() {
  cd $startdir/src/minos
  patch -p1 <$startdir/src/minos-$pkgver.patch
  cd $startdir/src/minos/gcc
  make ORB=omniorb OMNIORB_ROOT=/usr || return 1
  install -d $startdir/pkg/usr/bin
  install -t $startdir/pkg/usr/bin $startdir/src/minos/gcc/bin/Minos_omniorb
  install -d $startdir/pkg/usr/share/doc/$pkgname
  install -t $startdir/pkg/usr/share/doc/$pkgname $startdir/src/minos/README.unix
  install -t $startdir/pkg/usr/share/doc/$pkgname $startdir/src/minos/gcc/run_minos_omniorb
}

