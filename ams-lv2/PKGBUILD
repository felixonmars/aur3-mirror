# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=ams-lv2
pkgver=1.0.2
pkgrel=1
pkgdesc="Port of Alsa Modular Synth internal modules into LV2."
arch=('i686' 'x86_64')
url="http://objectivewave.wordpress.com/ams-lv2/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'gtkmm')
makedepends=('python2' 'lvtk')
provides=('lv2.ams')
source=("https://github.com/blablack/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('a1a8a7b0d78163364ac24b4b1b4fe389')

build() {
  cd $pkgname-$pkgver
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd $pkgname-$pkgver
  python2 waf --destdir="$pkgdir/" install
}
