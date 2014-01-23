# Maintainer: Alexander Kazarin <boiler[at]co.ru>
pkgname=showimage
pkgver=1.8.1
pkgrel=1
pkgdesc="ShowImage is a simple KDE based image viewer using the maximum space inside its window without cluttering the window with menubar, toolbar or statusbar."
_odid=143977
url="http://opendesktop.org/content/show.php/ShowImage?content=${_odid}"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
optdepends=()
source=(http://opendesktop.org/CONTENT/content-files/${_odid}-${pkgname}-${pkgver}.tar.bz2)
md5sums=('2d9f09827f212457ad998e9c41496ebc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
}

