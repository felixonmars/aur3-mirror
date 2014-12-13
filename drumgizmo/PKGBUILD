# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=drumgizmo
pkgver=0.9.7
pkgrel=1
pkgdesc="A drum LV2 plugin and stand-alone application"
arch=('i686' 'x86_64')
url="http://www.drumgizmo.org/"
license=('GPL3')
groups=('lv2-plugins')
depends=('lv2' 'jack' 'libsmf' 'libx11' 'zita-resampler')
source=("${url}releases/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('70b8edc7ea8c35343c8f8a6c90592b12')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-static=no \
              --enable-lv2
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
