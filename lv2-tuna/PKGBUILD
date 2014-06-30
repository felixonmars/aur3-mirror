# Maintainer: speps <speps dot aur dot archlinux dot org>

_rtkver=0.2.1
pkgname=lv2-tuna
pkgver=0.3.1
pkgrel=1
pkgdesc="An musical instrument tuner with strobe characteristics in LV2 plugin format."
arch=('i686' 'x86_64')
url="https://github.com/x42/tuna.lv2"
license=('GPL')
groups=('lv2-plugins')
depends=('gtk2' 'fftw' 'lv2')
makedepends=('mesa')
provides=('tuna.lv2')
conflicts=('tuna.lv2')
source=("$url/archive/v$pkgver.tar.gz"
        "https://github.com/x42/robtk/archive/v$_rtkver.tar.gz")
md5sums=('60e13f5b40490498b028685dc3c40a33'
         '7386e01ebab6616dbefaa3365c9c5bb7')

prepare() {
  export RW=../robtk-$_rtkver/
}

build() {
  cd tuna.lv2-$pkgver
  make
}

package() {
  cd tuna.lv2-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
