# Maintainer: speps <speps dot aur dot archlinux dot org>

_rtkver=0.2.0
pkgname=lv2-sisco
pkgver=0.6
pkgrel=1
pkgdesc="A simple audio oscilloscope with variable time scale in LV2 plugin format."
arch=('i686' 'x86_64')
url="http://x42.github.io/sisco.lv2/"
license=('GPL')
groups=('lv2-plugins')
depends=('gtk2' 'lv2')
makedepends=('mesa')
provides=('sisco.lv2')
conflicts=('sisco.lv2')
source=("https://github.com/x42/sisco.lv2/archive/v$pkgver.tar.gz"
        "https://github.com/x42/robtk/archive/v$_rtkver.tar.gz")
md5sums=('e84334a9a383e69f89385c5e85911b76'
         '32c6dc7f97280dbb8af2e9f8545937ea')

prepare() {
  export RW=../robtk-$_rtkver/
}

build() {
  cd sisco.lv2-$pkgver
  make
}

package() {
  cd sisco.lv2-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
