# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=igstk  
pkgver=4.4
pkgrel=1 
pkgdesc="The Image-Guided Surgery Toolkit"
url="http://www.igstk.org/"
arch=('i686' 'x86_64')
license=('GPL')
optdepends=('opencv')
makedepends=('insight-toolkit' 'vtk')
source=(http://public.kitware.com/IGSTKWIKI/images/e/e2/IGSTK-${pkgver//./-}.tar.gz gcc.patch)
md5sums=('5e8f7c3b1ba2b8ee9f1d78855aa87de1'
         'ba3574b70efacd5fcd60c5bf5af869f9')

build() {
  cd $srcdir/IGSTK-${pkgver}
  patch -p1 < $srcdir/gcc.patch
  VTK_DIR=/usr/lib/vtk cmake -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \.
  make 
}
package() {
  cd $srcdir/IGSTK-${pkgver}
  make DESTDIR=$pkgdir install
}
