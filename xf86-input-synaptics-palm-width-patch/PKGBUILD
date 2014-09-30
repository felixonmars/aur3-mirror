# $Id: PKGBUILD 222166 2014-09-20 11:55:30Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xf86-input-synaptics-palm-width-patch
pkgver=1.8.1
pkgrel=1
pkgdesc="Synaptics driver for notebook touchpads"
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libxtst' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=21' 'libxi' 'libx11' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.16' 'X-ABI-XINPUT_VERSION<21' 'X-ABI-XINPUT_VERSION>=22')
replaces=('synaptics')
provides=('synaptics' 'xf86-input-synaptics')
conflicts=('synaptics')
groups=('xorg-drivers' 'xorg')
source=(http://xorg.freedesktop.org/releases/individual/driver/xf86-input-synaptics-${pkgver}.tar.bz2
        add_tapbuttons.diff
        fix_palm_detect.patch)
sha256sums=('d74fdaf29e9888a2cb494e16d0a9ddb24265c5c765b05392b69c50e84ffbf09a'
            '5298d3e871db3768b34cf8516d3f53f9291202e2ea5de3300256e1cd9119a1ec'
            '8b8e802a510e5f6380e91aeca48b917d38b460baa4a5da6c1dbb83555653bc37')

build() {
  cd xf86-input-synaptics-${pkgver}
  
  # * upstream disabled tapping by default if a physical left button is present - see FS#33282
  # * enable MatchDevicePath directive by default - FS#33291
  patch -Np1 -i ${srcdir}/add_tapbuttons.diff

  # FIX palm detection on my x240
  patch -Np1 -i ${srcdir}/fix_palm_detect.patch

  
  ./configure --prefix=/usr
  make
}

package() {
  cd xf86-input-synaptics-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
