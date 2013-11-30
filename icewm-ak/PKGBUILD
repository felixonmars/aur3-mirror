# $Id$
# Maintainer: ak <kovyale@gmail.com>

pkgname=icewm-ak
_pkgname=icewm
pkgver=1.3.8
pkgrel=1
pkgdesc="A Window Manager designed for speed, usability, and consistency. Patched: more network device monitors, better acpi power support, cpuinfo_cur_freq to support intel_pstate freq."
arch=('i686' 'x86_64')
url="http://www.icewm.org/"
license=('LGPL')
depends=('libxrandr' 'libxft' 'libsm' 'libxinerama' 'gdk-pixbuf2')
makedepends=('xorg-mkfontdir')
provides=('icewm')
conflicts=('icewm')
replaces=('icewm')
source=(http://downloads.sourceforge.net/sourceforge/icewm/${_pkgname}-${pkgver}.tar.gz
        ignore_workarea_hints.patch icewm-cpustatus.patch 
		aapm_power.patch hack_more_netdevs.patch 
		acpustatus_read_cpuinfo_cur_freq.patch 
		net-rate-in-bits-per-second.patch)
sha1sums=('dc9155227129be14aced00c24c572356e0fa5cd8'
          '88b4b198827d6590901c2c8bdba8826d928f6f1a'
          '0f4a02153496dadd26742f6bd3bdc166d7eafaed'
          'a0d126e0328c1de211484f591dd07c91765ec679'
          'c35522fe9647ce8c64f5b333a83433356ba21aac'
          'c4942fdd7b499228a8c1ec17e57ca704ea57bfc8'
          '5285ecfcd1654749951338b80c6c16e3dfa4d1d0')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/ignore_workarea_hints.patch"
  patch -p2 -i "${srcdir}/icewm-cpustatus.patch"
  patch -p1 -b -i "${srcdir}/aapm_power.patch"
  patch -p0 -b -i "${srcdir}/hack_more_netdevs.patch"
  patch -p0 -b -i "${srcdir}/acpustatus_read_cpuinfo_cur_freq.patch"
  patch -p0 -b -i "${srcdir}/net-rate-in-bits-per-second.patch"
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-shaped-decorations --enable-gradients
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install install-man install-docs install-desktop
}
