# Maintainer: Jove Yu <yushijun110 at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=cinnamon-bluetooth
pkgver=3.8.2
pkgrel=1
pkgdesc="The Cinnamon Bluetooth Module"
arch=(i686 x86_64)
url="https://github.com/linuxmint/cinnamon-bluetooth"
license=(GPL)
depends=('gtk3' 'cinnamon-control-center' 'gnome-bluetooth' 'libtool')
makedepends=('gnome-common' 'intltool')
install=cinnamon-bluetooth.install
source=("https://github.com/linuxmint/cinnamon-bluetooth/archive/${pkgver}.tar.gz")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  autoreconf -fi 

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var 

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}

md5sums=('53ea4719975b1360d84955dfe0fddd0c')
