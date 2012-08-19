# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org

pkgname=xf86-input-evdev1.10
_pkgname=xf86-input-evdev
pkgver=2.7.3
pkgrel=1
pkgdesc="X.org evdev input driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc' 'systemd-tools' 'mtdev')
makedepends=('xorg-server1.10-devel')
conflicts=('xorg-server<1.10.0' 'xorg-server>=1.10.99.902' 'xf86-input-evdev')
provides=("$_pkgname=$pkgver")
options=('!libtool' '!makeflags')
groups=('xorg1.10-drivers' 'xorg1.10')
source=(${url}/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('eb389413602c3d28c44bbfab0477c98582f0e2f5be5f41986e58e93a033fa504')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
