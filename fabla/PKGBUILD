# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=fabla
pkgver=1.3
pkgrel=1
pkgdesc="A sampler LV2 plugin"
arch=('i686' 'x86_64')
url="http://openavproductions.com/fabla/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'cairomm' 'libsndfile' 'ntk-git')
source=("https://github.com/harryhaaren/openAV-Fabla/archive/release-$pkgver.tar.gz")
md5sums=('6cdfb8374fd00f5fe9531ee88a8c3e97')

build() {
  cd openAV-Fabla-release-$pkgver
  make
}

package() {
  cd openAV-Fabla-release-$pkgver

  # plugin
  install -Dm644 dsp/fabla.ttl \
    "$pkgdir/usr/lib/lv2/fabla.lv2/fabla.ttl"
  install -Dm644 fabla.lv2/* "$pkgdir/usr/lib/lv2/fabla.lv2"

  # presets
  cp -a presets/* "$pkgdir/usr/lib/lv2"
}
