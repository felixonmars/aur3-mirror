# Contributor:Tutku Dalmaz <tutkudalmaz>
pkgname=pdnmesh
pkgver=0.2.1
pkgrel=1
pkgdesc="pdnMesh is an automatic mesh generator and solver for Finite Element problems."
url="http://pdnmesh.sourceforge.net/"
licence="GPL"
depends=('gcc-fortran' 'gtkglext' 'libgtk')
source=("http://jaist.dl.sourceforge.net/sourceforge/pdnmesh/$pkgname-$pkgver.tar.gz")
md5sums=('0fce52c99db5e894530f0e5ddde497d5')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
} 