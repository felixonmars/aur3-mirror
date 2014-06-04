# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <Alexander@archlinux.org>
# Contributor: Yegorius <yegorius@domic.us>

_pkgname=xf86-input-evdev
pkgname=${_pkgname}-remap
pkgver=2.8.2
pkgrel=1
pkgdesc="X.org evdev input driver with keycode remapping"
arch=(i686 x86_64)
url="http://www.thenautilus.net/cgit/xf86-input-evdev/"
license=('custom')
depends=('glibc' 'systemd' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto')
provides=('xf86-input-evdev')
conflicts=('xorg-server<1.15.0' 'xf86-input-evdev' 'X-ABI-XINPUT_VERSION<20' 'X-ABI-XINPUT_VERSION>=21')
options=('!makeflags')
groups=('xorg-drivers' 'xorg')
source=(http://xorg.freedesktop.org/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2
	evdev-remap.patch)
sha256sums=('750461749a83bdee7771592aa5c0db5e267b18d847078a4b8622f55b04797eb3'
            'a1b4fe353a603ca2fcda5f3d80fd6a444a0fc15d9a50f0e14d9c2a88319a4fc9')

prepare () {
  cd "$srcdir/${_pkgname}-${pkgver}"
  patch -Np1 -i "$srcdir/evdev-remap.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
