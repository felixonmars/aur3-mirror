# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lvtk
pkgver=1.2.0
pkgrel=1
pkgdesc="A set C++ wrappers around the LV2 C API"
arch=(i686 x86_64)
url="http://lvtoolkit.org/"
license=('GPL3')
depends=('lv2')
makedepends=('python2' 'boost' 'gtkmm')
optdepends=('gtkmm: lv2 sample plugins')
options=('staticlibs')
#source=("${url}code/browse/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
source=("https://github.com/lvtk/lvtk/archive/$pkgver.tar.gz")
md5sums=('ef3c883699357f9c7d85ba799f2bc69e')

build() {
  cd $pkgname-$pkgver
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir/" python2 waf install
}

# vim:set ts=2 sw=2 et:
