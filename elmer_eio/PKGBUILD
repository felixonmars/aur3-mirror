# Contributor: Christoph Siegenthaler < csi@gmx.ch >
# Contributor: Thomas Dziedzic

pkgname=elmer_eio
pkgver=5.4.0
pkgrel=3
pkgdesc='Elmer is a simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver.'
makepedends=('gcc-fortran')
url='http://www.csc.fi/elmer/'
arch=('i686' 'x86_64')
license=('GPL')
source=("ftp://ftp.funet.fi/pub/sci/physics/elmer/src/eio-$pkgver.tar.gz")
md5sums=('380f5b9311cbe89767d9107528ed67ff')

build() {
  cd eio-$pkgver

  export FC=gfortran
  ./configure --prefix=/opt/elmer || return 1

  make || return 1

  make DESTDIR="$pkgdir" install || return 1
}
