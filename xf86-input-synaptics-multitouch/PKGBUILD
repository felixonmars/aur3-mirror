# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Zezadas https://github.com/zezadas/synaptics-multitouch_arch-linux

pkgname=xf86-input-synaptics-multitouch
_pkgname=xf86-input-synaptics
pkgver=1.8.2
pkgrel=2
pkgdesc="Synaptics driver for notebook touchpads"
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libxtst' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=21' 'libxi' 'libx11' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.16' 'X-ABI-XINPUT_VERSION<21' 'X-ABI-XINPUT_VERSION>=22')
replaces=('synaptics')
provides=('synaptics' 'xf86-input-synaptics')
conflicts=('synaptics' 'xf86-input-synaptics')
groups=('xorg-drivers' 'xorg')
source=(http://xorg.freedesktop.org/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2
        add_tapbuttons.diff
        multitouch.diff)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cd ${_pkgname}-${pkgver}
  
  # * upstream disabled tapping by default if a physical left button is present - see FS#33282
  # * enable MatchDevicePath directive by default - FS#33291
  patch -Np1 -i ${srcdir}/add_tapbuttons.diff
  patch -Np1 -i ${srcdir}/multitouch.diff
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
