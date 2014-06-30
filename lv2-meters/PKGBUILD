# Maintainer: speps <speps dot aur dot archlinux dot org>

_rtkver=0.2.1
pkgname=lv2-meters
pkgver=0.8.0
pkgrel=1
pkgdesc="Collection of LV2 plugins for audio-level metering"
arch=('i686' 'x86_64')
url="https://github.com/x42/meters.lv2"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'fftw' 'gtk2')
provides=('meters.lv2')
conflicts=('meters.lv2')
source=("$url/archive/v$pkgver.tar.gz"
        "https://github.com/x42/robtk/archive/v$_rtkver.tar.gz")
md5sums=('641c7a4e7cad1a3b20e3c5e94cf3d90c'
         '7386e01ebab6616dbefaa3365c9c5bb7')

prepare() {
  export RW=../robtk-$_rtkver/
}

build() {
  cd meters.lv2-$pkgver
  make
}

package() {
  cd meters.lv2-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
