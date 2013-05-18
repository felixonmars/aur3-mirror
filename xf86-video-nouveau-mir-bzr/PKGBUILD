# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: buddabrod <buddabrod@gmail.com>

pkgname=xf86-video-nouveau-mir-bzr
_stable_ver=1.0.7
pkgver=2317
pkgrel=1
pkgdesc="Open Source 2D acceleration driver for nVidia cards"
arch=('i686' 'x86_64')
url="http://nouveau.freedesktop.org/"
license=('GPL')
depends=('libdrm' 'udev' 'nouveau-dri')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=13' 'resourceproto' 'scrnsaverproto')
makedepends+=('bzr')
conflicts=('xorg-server<1.13.0' 'X-ABI-VIDEODRV_VERSION<13' 'X-ABI-VIDEODRV_VERSION>=14')
provides+=("xf86-video-nouveau=${_stable_ver}")
conflicts+=('xf86-video-nouveau')
groups=('xorg-drivers' 'xorg')
options=('!libtool')
install=xf86-video-nouveau.install
source=("xf86-video-nouveau::bzr+http://bazaar.launchpad.net/~mir-team/mir/xf86-video-nouveau/")
sha512sums=('SKIP')

pkgver() {
  cd xf86-video-nouveau
  bzr revno
}

build() {
  cd "${srcdir}/xf86-video-nouveau"
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/xf86-video-nouveau"
  make DESTDIR="${pkgdir}" install
}
