# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=lv2-midifilter
pkgver=0.3.0
pkgrel=1
pkgdesc="LV2 plugins to filter midi events"
arch=('i686' 'x86_64')
url="http://x42.github.io/midifilter.lv2/"
license=('GPL')
groups=('lv2-plugins')
depends=('glibc' 'lv2')
provides=('midifilter.lv2')
conflicts=('midifilter.lv2')
source=("https://github.com/x42/midifilter.lv2/archive/v$pkgver.tar.gz")
md5sums=('24c608b333680570617f1ca8b3fad187')

build() {
  cd midifilter.lv2-$pkgver
  make
}

package() {
  cd midifilter.lv2-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
