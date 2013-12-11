# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=lv2-balance
pkgver=0.4.3
pkgrel=1
pkgdesc="An LV2 audio-plugin for stereo balance control with optional per channel delay."
arch=('i686' 'x86_64')
url="https://github.com/x42/balance.lv2"
license=('GPL')
groups=('lv2-plugins')
depends=('ftgl' 'ttf-freefont' 'lv2')
makedepends=('mesa')
provides=('balance.lv2')
conflicts=('balance.lv2')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('ab4a40f2bf9d3e2369e0676d39724e1d')

prepare() {
  export FONTFILE=/usr/share/fonts/TTF/FreeSansBold.ttf
}

build() {
  cd balance.lv2-$pkgver
  make
}

package() {
  cd balance.lv2-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
