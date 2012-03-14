# Maintainer:  Jesse Jaara	 <gmail.com: jesse.jaara
# Contributor: Matt Monaco	 <0x01b.net: dgbaley27>
# Contributor: Jan de Groot	 <archlinux.org: jgc>
# Contributor: Tobias Powalowski <archlinux.org: tpowa>
# Contributor: Thomas Bächler	 <archlinux.org: thomas>
# Contributor: Alexander Baldeck <archlinux.org: alexander>

pkgname=xf86-input-synaptics-clickpad
pkgver=1.5.99.901
pkgrel=1
pkgdesc="Synaptics driver for laptops with clickpad devices (Chase Douglas branch v4 + Takeshi's led work)"
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libxtst' 'mtdev')
makedepends=('xorg-server-devel>=1.11.99.902' 'libxi' 'libx11')
optdepends=('synaptics-led')
provides=('xf86-input-synaptics')
conflicts=('xf86-input-synaptics')
groups=('xorg-drivers' 'xorg')
options=(!libtool)
backup=('etc/X11/xorg.conf.d/10-synaptics.conf')
source=('10-synaptics.conf' 'clickpad_led_tap.patch'
	"http://xorg.freedesktop.org/releases/individual/driver/xf86-input-synaptics-${pkgver}.tar.bz2")

build() {
  cd "${srcdir}/xf86-input-synaptics-${pkgver}"

  patch -p1 -i ../clickpad_led_tap.patch

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

md5sums=('3b81a81b958dfe3cac3cdef7ee85f1ce'
         '11924c68d71e1670f11c30b85b358c17'
         'd0c28aa15887deca4051ffea67b31d64')
