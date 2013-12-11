# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=lv2-xfade
pkgver=0.1.1
pkgrel=1
pkgdesc="An LV2 audio-plugin for stereo cross-fading 2 x 2 input channels to 2 output channels."
arch=('i686' 'x86_64')
url="https://github.com/x42/xfade.lv2"
license=('GPL')
groups=('lv2-plugins')
depends=('glibc' 'lv2')
provides=('xfade.lv2')
conflicts=('xfade.lv2')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('7b246193ec7040c532de1ccb9dcc4897')

build() {
  cd xfade.lv2-$pkgver
  make
}

package() {
  cd xfade.lv2-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
