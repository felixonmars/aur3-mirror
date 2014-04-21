# $Id: PKGBUILD 207603 2014-03-12 18:12:33Z andyrtr $
# Maintainer: kang <kang@insecure.ws>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xf86-input-synaptics-sony-vp
pkgdlname=xf86-input-synaptics
pkgver=1.7.4
pkgrel=1
pkgdesc="Synaptics driver for notebook touchpads, with belly-click protection for Sony Vaio Pros"
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libxtst' 'mtdev')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=20' 'libxi' 'libx11' 'resourceproto' 'scrnsaverproto')
conflicts=('xorg-server<1.15.0' 'X-ABI-XINPUT_VERSION<20' 'X-ABI-XINPUT_VERSION>=21')
replaces=('synaptics')
provides=('synaptics')
conflicts=('synaptics')
groups=('xorg-drivers' 'xorg')
backup=('etc/X11/xorg.conf.d/50-synaptics.conf')
source=(http://xorg.freedesktop.org/releases/individual/driver/${pkgdlname}-${pkgver}.tar.bz2
        add_tapbuttons.diff
		fix_belly_click.patch)
sha256sums=('56a2d2df7bd39e29f56102c62f153e023f3e9b2f5e255309d33fab8e81945af7'
            '5298d3e871db3768b34cf8516d3f53f9291202e2ea5de3300256e1cd9119a1ec'
			'6d4e68b19b6cb4d60156503ff9ec12a4d3b92f55babb86b1e712227607be5812')

build() {
  cd ${pkgdlname}-${pkgver}
  
  # * upstream disabled tapping by default if a physical left button is present - see FS#33282
  # * enable MatchDevicePath directive by default - FS#33291
  patch -Np1 -i ${srcdir}/add_tapbuttons.diff
  # * fix clicking from the bottom of the chassis ('belly clicking') for flimsy chassis like the vaio pro
  patch -Np0 -i ${srcdir}/fix_belly_click.patch
  
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgdlname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"
  install -m644 conf/50-synaptics.conf "${pkgdir}/etc/X11/xorg.conf.d/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgdlname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgdlname}/"

  rm -rf "${pkgdir}/usr/share/X11"
}
