# Maintainer: Hugh Young
# Original by: Jan Frederick Eick <j.f.eick@gmx.de>

pkgname=xf86-input-synaptics-mtpatch
pkgver=1.7.1
pkgrel=1
pkgdesc="Synaptics driver for notebook touchpads patched for pass through of multitouch events"
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libxtst' 'mtdev')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=19' 'libxi' 'libx11' 'resourceproto' 'scrnsaverproto') 
conflicts=('xorg-server<1.14.0' 'X-ABI-XINPUT_VERSION<19' 'X-ABI-XINPUT_VERSION>=20')
replaces=('synaptics')
provides=('synaptics')
conflicts=('synaptics')
groups=('xorg-drivers' 'xorg')
options=(!libtool)
backup=('etc/X11/xorg.conf.d/10-synaptics.conf')
source=(http://xorg.freedesktop.org/releases/individual/driver/xf86-input-synaptics-${pkgver}.tar.bz2
        https://raw.github.com/jfeick/xf86-input-synaptics-mtpatch/master/send_multitouch_events.patch
        10-synaptics.conf )
sha256sums=('db5825660e1fb23190697f609bf75d4450fe707344a14298e1c9b47039bbb58e'
            '03dcb9d789f54fa1dc7828fd64a8c30345b864f60886a6551877c911a6c0ff1d'
	    'aad6e00b68a66344f5191a0f020c3e9a021bd32b56ee286769f6fd6525c08f65'
            )

build() {
  cd "${srcdir}/xf86-input-synaptics-${pkgver}"
  patch -Np1 -i ../send_multitouch_events.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/xf86-input-synaptics-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"
  install -m644 "${srcdir}/10-synaptics.conf" "${pkgdir}/etc/X11/xorg.conf.d/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/usr/share/X11"
}

