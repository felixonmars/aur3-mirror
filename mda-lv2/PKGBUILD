# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=mda-lv2
pkgver=1.2.2
pkgrel=1
pkgdesc="An LV2 port of the MDA plugins by Paul Kellett"
arch=(i686 x86_64)
url="http://drobilla.net/software/mda-lv2/"
license=('GPL3')
depends=('lv2')
makedepends=('python2')
source=("http://download.drobilla.net/$pkgname-$pkgver.tar.bz2")
md5sums=('1962f48c54eafe52a3d2471cd3072aa8')

build() {
  cd $pkgname-$pkgver
  python2 ./waf configure --prefix=/usr
  python2 ./waf
}

package() {
  cd $pkgname-$pkgver
  python2 ./waf --destdir="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
