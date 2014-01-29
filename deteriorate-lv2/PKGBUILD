# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=deteriorate-lv2
pkgver=1.0.3
pkgrel=1
pkgdesc="A set of LV2 plugins to deteriorate the sound quality"
arch=('i686' 'x86_64')
url="http://objectivewave.wordpress.com/deteriorate-lv2/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'gtkmm')
makedepends=('python2' 'lvtk')
provides=('lv2.deteriorate')
source=("https://github.com/blablack/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('e6a03415cef26da33b287ca5fdc7d654')

build() {
  cd $pkgname-$pkgver
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd $pkgname-$pkgver
  python2 waf --destdir="$pkgdir/" install
}
