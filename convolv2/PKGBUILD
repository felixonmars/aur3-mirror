# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=convolv2
pkgver=0.2.2
pkgrel=1
pkgdesc="LV2 convolution plugin"
arch=('i686' 'x86_64')
url="https://github.com/x42/convoLV2"
license=('GPL')
groups=('lv2-plugins')
depends=('gtk2' 'libsamplerate' 'zita-convolver' 'lv2')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('c22979d29a382edc33fc494a49a13886')

build() {
  cd convoLV2-$pkgver
  make
}

package() {
  cd convoLV2-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
