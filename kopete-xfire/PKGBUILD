# Contributor: Tilo Brueckner  blueperil at gmx de

pkgname=kopete-xfire
pkgver=0.0.8
pkgrel=2
pkgdesc="Xfire for Kopete is a protocol plugin for Kopete allowing access to the Xfire gaming network."
arch=('i686' 'x86_64')
url="http://code.google.com/p/kopete-xfire/"
license=('GPL')
depends=('kdenetwork-kopete')
makedepends=('make' 'cmake' 'automoc4')
source=(http://kopete-xfire.googlecode.com/files/${pkgname}-${pkgver}.tar.gz
        compilefix.patch)
sha256sums=('4d3f5650458a9ae4dbfb77bbdb0dcb81c44992efc1d61d12768496ecb666c7aa'
            '883ba8bb048584ab7c5c1a7a7d2da7574669b089561890baff718a0a240991dd')

build() {
  cd $srcdir/$pkgname/

  patch -Np0 < ${srcdir}/compilefix.patch
  
  mkdir build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
  make || return 1
}
package() {
  cd $srcdir/$pkgname/build

  make DESTDIR=$pkgdir install || return 1
}
