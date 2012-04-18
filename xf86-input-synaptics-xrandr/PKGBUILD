# Maintainer: Matt Phipps <mphipps1@umd.edu>
# Contributor: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Kaspar Bumke <kaspar.bumke@gmail.com>

pkgname=xf86-input-synaptics-xrandr
pkgver=1.5.99
pkgrel=5
_upstreamname=xf86-input-synaptics
_gitversion=dfc3a8ed713c2878407c6443c4d3092da3125e0c
pkgdesc="Synaptics driver for notebook touchpads with patch to enable axis rotation."
arch=('i686')
url="https://github.com/garaden/synaptics-xrandr/"
license=('custom')
groups=('xorg-drivers' 'xorg')
depends=('libxtst')
makedepends=('xorg-server-devel>=1.12.1-1' 'libxi' 'libx11')
provides=('synaptics')
conflicts=('xorg-server<1.12.1-1' 'synaptics' 'synaptics-xrandr')
replaces=('synaptics-xrandr')
backup=('etc/X11/xorg.conf.d/10-synaptics.conf')
options=(!libtool)
source=(
http://cgit.freedesktop.org/xorg/driver/${_upstreamname}/snapshot/${_upstreamname}-${_gitversion}.tar.gz
10-synaptics.conf
synaptics-xrandr.patch)
md5sums=('96824ee4e6c720cd3081a8c13761fbe3'
         '3b81a81b958dfe3cac3cdef7ee85f1ce'
         '99da8bd1dbacfe9a29ae2d38a9cd9238')

build() {
  cd ${srcdir}/${_upstreamname}*
  patch -p1 < ../synaptics-xrandr.patch || return 1
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_upstreamname}*
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"
  install -m644 "${srcdir}/10-synaptics.conf" "${pkgdir}/etc/X11/xorg.conf.d/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/usr/share/X11"
}
