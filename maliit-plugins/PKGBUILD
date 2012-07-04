# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=maliit-plugins
pkgver=0.92.2
pkgrel=1
pkgdesc="Maliit Input Methods - Plugins"
arch=('x86_64' 'i686')
url="http://maliit.org"
license=('LGPL')
depends=('qt' 'maliit-framework')
source=(http://maliit.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('4a74705d1b3e62c89723c60425dcb229')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # BUILD
  qmake -r . CONFIG+=notests
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make install INSTALL_ROOT="$pkgdir/"
} 
