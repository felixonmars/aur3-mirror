# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=beatslash-lv2
pkgver=1.0.2
pkgrel=1
pkgdesc="A set of LV2 plugins to mangle, slash, repeat and do much more with your beats."
arch=('i686' 'x86_64')
url="http://objectivewave.wordpress.com/beatslash-lv2/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'gtkmm')
makedepends=('python2' 'lvtk')
provides=('lv2.beatslash')
source=("https://github.com/blablack/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('321edc446c591750b014d2ef90118f08')

build() {
  cd $pkgname-$pkgver
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd $pkgname-$pkgver
  python2 waf --destdir="$pkgdir/" install
}
