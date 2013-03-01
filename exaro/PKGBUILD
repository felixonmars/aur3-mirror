# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=exaro
pkgver=2.0.0
pkgrel=3
pkgdesc="report engine similar to Jasper or Crystal Reports."
url="http://exaro.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt4' 'zint' 'quazip' 'propertyeditor' 'shared-mime-info')
makedepends=('cmake' 'xz')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}_${pkgver}.tar.lzma
        exaro.patch)
md5sums=('4089f2f826aedda3fb8bd8bd8fd92e4a'
         'e20aed7618030bada2f138d831d7419f')

build() {
  #lzma -dc ../${pkgname}_${pkgver}.tar.lzma | tar -xv -f -
  cd ${srcdir}/${pkgname}_${pkgver}
  patch -p1 -i $srcdir/../exaro.patch 
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
