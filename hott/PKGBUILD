# Maintainer: Andrew Swan <wakelin.swan+arch@gmail.com>
pkgname=hott
pkgver=20130724
pkgrel=1 
pkgdesc="Homotopy type theory library for coq"
url="https://github.com/HoTT/HoTT"
arch=('i686' 'x86_64')
license=('BSD')
depends=('coq-hott')
install='hott.install'
source=('git+https://github.com/HoTT/HoTT.git'
  'respectdestdir.patch')
md5sums=('SKIP'
  '9c78a9e68c29559f97e77f9d0431aea7')

prepare() {
  cd $srcdir/HoTT

  # make sure everything goes into $pkgdir when we install
  patch -p1 < $startdir/respectdestdir.patch
}

build() {
  cd $srcdir/HoTT

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/HoTT
  make DESTDIR=$pkgdir install
}
