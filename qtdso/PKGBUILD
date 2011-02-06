# Contributor: Marcel Schneider <marcelATcoopmastersDOTde>
pkgname=qtdso
pkgver=0.3.1
pkgrel=2
arch=('i686')
pkgdesc="QtDSO is a frontend for the Velleman PCS64i digital oscilloscope."
url="http://www.mtoussaint.de/qtdso.html"
license=('GPL')
depends=(qt3 libieee1284 fftw)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.mtoussaint.de/$pkgname-$pkgver.tgz gcc.patch)
md5sums=('ad8223b53c767a74a87b73e69c435e8e'
         '90fd2f0ea5de2ce1cd9ab62a0eab1575')

build() {
  export PATH=/opt/qt/bin:$PATH #make sure to use qmake version qt3
  
  mv $startdir/src/QtDSO-$pkgver $startdir/src/$pkgname-$pkgver
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../../gcc.patch ||return 1
  mkdir -p $startdir/pkg/usr/bin
  ./configure 
   make || return 1
  cp bin/$pkgname $startdir/pkg/usr/bin 
  #find $startdir/pkg -name '*.la' -exec rm {} \;
}


