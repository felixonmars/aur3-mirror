# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: gripir <gripir@exigen.org>
# Contributor: gripir <gripir@exigen.org>
pkgname=libopenusb
pkgver=1.0.2
pkgrel=1
pkgdesc="OpenUSB library offers raw access to USB devices."
arch=(i686)
url="http://sourceforge.net/projects/openusb/"
license=('GPL')
groups=
provides=
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=('libopenusb.install')
source=(http://downloads.sourceforge.net/openusb/$pkgname-$pkgver.tar.gz)
md5sums=('bea36c626870690f4bdebdcfa6c051d3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
