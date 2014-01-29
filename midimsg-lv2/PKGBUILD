# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=midimsg-lv2
pkgver=0.0.2
pkgrel=1
pkgdesc="A collection of basic lv2 plugins to translate midi messages to usable values."
arch=('i686' 'x86_64')
url="http://objectivewave.wordpress.com/midimsg-lv2/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2')
makedepends=('python2')
provides=('lv2.midimsg')
source=("https://github.com/blablack/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('955de0b02a05c191fbd01d306ebbadd6')

build() {
  cd $pkgname-$pkgver
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd $pkgname-$pkgver
  python2 waf --destdir="$pkgdir/" install
}
