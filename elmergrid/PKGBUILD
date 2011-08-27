# Contributor: Christoph Siegenthaler < csi@gmx.ch >
# Contributor: Thomas Dziedzic

pkgname=elmergrid
pkgver=5.4.0
pkgrel=1
pkgdesc='Elmer is a simulation tool for CFD, FEM, electromagnetics, heat transfer and others featuring a PDE solver.'
depends=('elmer_umfpack' 'elmer_mathlibs' 'elmer_matc')
url='http://www.csc.fi/elmer/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash')
source=("http://www.nic.funet.fi/pub/sci/physics/elmer/src/elmergrid-$pkgver.tar.gz"
        'elmergrid'
        'rename.patch')
md5sums=('56fd20d86ba8eb202cf963e1fb85927c'
         '3062795949480101281cd2e9271376ad'
         '08366ab9c3dde8209c521aefcf3519f3')

build() {
  patch -Np0 < rename.patch

  cd $pkgname-$pkgver

  ./configure --prefix=/opt/elmer || return 1

  make || return 1

  make DESTDIR="$pkgdir" install || return 1
  install -D -m755 "$srcdir/elmergrid" "$pkgdir/usr/bin/elmergrid"
}
