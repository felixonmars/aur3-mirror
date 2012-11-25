# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=xf86-input-evdev-mali
pkgbase=xf86-input-evdev
pkgver=2.7.3
pkgrel=1
pkgdesc="X.org evdev input driver"
arch=('armv7h')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('glibc' 'systemd-tools' 'mtdev')
makedepends=('xorg-server-devel-mali>=1.12.0')
provides=('xf86-input-evdev')
conflicts=('xf86-input-evdev' 'xorg-server<1.12.0')
replaces=('xf86-input-evdev')
options=('!libtool' '!makeflags')
groups=('xorg-drivers' 'xorg')
source=(${url}/releases/individual/driver/${pkgbase}-${pkgver}.tar.bz2)
sha256sums=('eb389413602c3d28c44bbfab0477c98582f0e2f5be5f41986e58e93a033fa504')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
