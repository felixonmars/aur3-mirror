# Maintainer: Yukicanis <yukicanis.@gmail.com>
# Contributor: Riccardo Berto <riccardobrt@gmail.com>
# Previous Contributor: vbmithr
# Contributor: Flamelab <panosfilip at gmail dot com>

pkgname=xf86-video-ati-xwayland-git
_realpkgname=xf86-video-ati
pkgver=50b3b68
pkgrel=1
pkgdesc="X.org ati video driver for XWayland"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
provides=("${_realpkgname}")
depends=('xwayland-git' 'libdrm' 'libpciaccess' 'udev' 'pixman' 'ati-dri')
makedepends=('xwayland-git' 'libdrm' 'xf86driproto' 'mesa' 'git' 'glproto'\
             'resourceproto' 'scrnsaverproto')
conflicts=('xf86-video-ati')
provides=('xf86-video-ati')
options=('!libtool')
license=('custom')
source=('git+https://github.com/RAOF/xf86-video-ati#branch=xwayland')
md5sums=('SKIP')

build() {
  cd $srcdir/xf86-video-ati
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/xf86-video-ati
  make DESTDIR="${pkgdir}" install 
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

pkgver() {
  cd $srcdir/xf86-video-ati
  git describe --always | sed 's|xf86-video-ati-||g' | sed 's|-|.|g'
}
