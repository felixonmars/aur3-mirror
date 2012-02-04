# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=kvpnc-lang
pkgver=0.9.6
pkgrel=1
pkgdesc="Traslations for KVpnc. KVpnc is a KDE Desktop Environment frontend for various vpn clients"
arch=(i686 x86_64)
url="http://home.gna.org/kvpnc/"
license=("GPL")
depends=('kdelibs' 'kvpnc')
makedepends=('cmake' 'automoc4')
source=(http://download.gna.org/kvpnc/kvpnc-${pkgver}-kde4-locale.tar.bz2)
md5sums=('8610d2e351dfe144218712986f80d1eb')

build() {
  cd $srcdir/kvpnc-${pkgver}-kde4-locale
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

