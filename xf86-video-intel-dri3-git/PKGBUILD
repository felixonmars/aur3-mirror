# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lone_Wolf <lonewolf at xs4all dot org>
# based off archlinux stock xf86-video-intel package, version 2.99.910-1

pkgname=xf86-video-intel-dri3-git
pkgver=7820.6caf295
pkgrel=1
arch=(i686 x86_64)
url="http://cgit.freedesktop.org/~keithp/xf86-video-intel/log/?h=dri3"
license=('custom')
pkgdesc="X.org Intel video drivers, out-of-tree keithp' dri3 branch"

depends=('intel-dri' 'libxvmc' 'pixman' 'xcb-util>=0.3.9' 'glamor-egl' 'systemd' 'libdrm' 'mesa>=10.2.0' 'clutter>=1.16.4-3')
#depends=('libxvmc' 'pixman' 'xcb-util>=0.3.9' 'glamor-egl' 'systemd' 'libdrm' 'mesa>=10.2.0')
makedepends=('git' 'xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=15' 'libx11' 'libxrender'
             # additional deps for intel-virtual-output
            'libxrandr' 'libxinerama' 'libxcursor' 'libxtst' 'libxdamage')
optdepends=('libxrandr: for intel-virtual-output'
            'libxinerama: for intel-virtual-output'
            'libxcursor: for intel-virtual-output'
            'libxtst: for intel-virtual-output'
            'libxdamage: for intel-virtual-output')

provides=('xf86-video-intel')
conflicts=('xorg-server<1.15.0' 'X-ABI-VIDEODRV_VERSION<15' 'X-ABI-VIDEODRV_VERSION>=16'
           'xf86-video-intel')
source=("${pkgname}::git://people.freedesktop.org/~keithp/xf86-video-intel#branch=dri3")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${pkgname}"
  ./autogen.sh --prefix=/usr \
    --enable-glamor
  make
}

check() {
  cd "${pkgname}"
  make check
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
