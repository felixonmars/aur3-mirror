# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Artem Grunichev <gluk@umbrosia.ru>

pkgname=maliit-framework
pkgver=0.99.0
pkgrel=1
pkgdesc="Maliit Input Methods - Framework"
arch=('x86_64' 'i686')
url="http://maliit.org"
license=('LGPL')
depends=('qt5-base' 'gtk2' 'gtk3')
install=${pkgname}.install
source=(http://maliit.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c5e8c67cbfb514122518d92f1edcc990')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # BUILD
  qmake -r .
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make install INSTALL_ROOT="$pkgdir/"
} 
