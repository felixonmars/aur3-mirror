# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=lv2-nodelay
pkgver=0.1.2
pkgrel=1
pkgdesc="An LV2 audio delay line plugin with latency reporting."
arch=('i686' 'x86_64')
url="https://github.com/x42/nodelay.lv2"
license=('GPL')
groups=('lv2-plugins')
depends=('glibc' 'lv2')
provides=('nodelay.lv2')
conflicts=('nodelay.lv2')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('b8e6b12e2cbe6aca07bbe9368e5a7ec1')

build() {
  cd nodelay.lv2-$pkgver
  make
}

package() {
  cd nodelay.lv2-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
