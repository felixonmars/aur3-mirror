# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=libxnvctrl
pkgver=331.38
pkgrel=1
pkgdesc="A library providing the NV-CONTROL API"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
license=('GPL2')
makedepends=('libxext')
options=('staticlibs')
source=("http://download.nvidia.com/XFree86/nvidia-settings/nvidia-settings-${pkgver}.tar.bz2")
sha1sums=('ad3fd407dcf8678c770d6202651eb08162fd5e5d')

build() {
  cd "$srcdir/nvidia-settings-$pkgver/src/libXNVCtrl"
  make clean
  make
}

package() {
  cd "$srcdir/nvidia-settings-$pkgver/src/libXNVCtrl"
  # install libXNVCtrl.a and headers
  install -d -m 755 "$pkgdir"/usr/{include/NVCtrl,lib}
  install -m 644 nv_control.h NVCtrl{,Lib}.h "$pkgdir"/usr/include/NVCtrl/
  install -m 644 libXNVCtrl.a "$pkgdir"/usr/lib/libXNVCtrl.a
}
