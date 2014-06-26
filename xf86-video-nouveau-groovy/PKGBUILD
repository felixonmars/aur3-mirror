# Maintainer: Matthew Coulson <jmcoulson@gmail.com>

pkgname=xf86-video-nouveau-groovy
_pkgname=xf86-video-nouveau
pkgver=1.0.10
pkgrel=2
pkgdesc="Open Source 2D acceleration driver for nVidia cards patched for low resolution CRT displays"
arch=('i686' 'x86_64')
url="http://nouveau.freedesktop.org/"
license=('GPL')
depends=('libdrm' 'udev' 'nouveau-dri')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=15')
conflicts=('xorg-server<1.15.0' 'X-ABI-VIDEODRV_VERSION<15' 'X-ABI-VIDEODRV_VERSION>=16' 'xf86-video-nouveau')
provides=('xf86-video-nouveau')
replaces=('xf86-video-nouveau')
groups=('xorg-drivers' 'xorg')
install=$pkgname.install
source=("http://xorg.freedesktop.org/archive/individual/driver/$_pkgname-$pkgver.tar.bz2"
	'allow_low_res.diff')
sha256sums=('c1bab3160bae96d485fc93a048d19775398aa85b407bac53020675f7e995db9d'
            '0e3133ed5e6c6eebc8d1c64dc24e47629a9f839bebf7cef91131c686657707af')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i "${srcdir}/allow_low_res.diff"
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
