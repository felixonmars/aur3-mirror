# Maintainer: Ushakov
# Contributor: Ushakov
pkgname=imagine-generator
pkgver=1.2
pkgrel=1
pkgdesc="Scriptable image generator."
arch=(i686 x86_64)
url="https://github.com/dmitriyushakov/imaginegenerator"
license="GPLv2"
depends=('qt5-base')
source=(https://github.com/dmitriyushakov/imaginegenerator/archive/v$pkgver.tar.gz)
md5sums=('1ef55d5bab64d666c2fceea09c331a7c')

build() {
  cd $srcdir
  tar -xzf v$pkgver.tar.gz
  cd imaginegenerator-$pkgver
  qmake-qt5 ImagineGenerator.pro PREFIX=/usr
  make
}

package(){
  cd $srcdir/imaginegenerator-$pkgver/
  make install INSTALL_ROOT=$pkgdir
}