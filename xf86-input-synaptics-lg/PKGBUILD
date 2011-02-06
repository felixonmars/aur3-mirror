# $Id$
# Maintainer: Rickard Eriksson <rickard.eriksson@gigabit.nu>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
pkgname=xf86-input-synaptics-lg
name=xf86-input-synaptics
pkgver=1.1.3
pkgrel=1
pkgdesc="Patched synaptics driver for some LG touchpads"
arch=(i686 x86_64)
license=('custom')
url="http://w1.894.telia.com/~u89404340/touchpad/"
depends=('libx11')
makedepends=('pkgconfig' 'xorg-server>=1.5.3')
replaces=('synaptics')
provides=('synaptics')
conflicts=('synaptics')
options=(!libtool)
source=(http://xorg.freedesktop.org/releases/individual/driver/${name}-${pkgver}.tar.bz2)
md5sums=('fa002949c6b4cdd5a4f792e5dbb824f5')

build() {
  cd "${srcdir}/${name}-${pkgver}"
  cd src
  patch < ../../../touchpad.patch
  cd ..
  patch -t fdi/11-x11-synaptics.fdi < ../../lg-a1-synaptics.diff
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -d "${pkgdir}/usr/share/hal/fdi/policy/10osvendor"
  install -m644 fdi/*.fdi "${pkgdir}/usr/share/hal/fdi/policy/10osvendor/" || return 1
  install -m755 -d "${pkgdir}/usr/share/licenses/${name}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${name}/" || return 1
}

