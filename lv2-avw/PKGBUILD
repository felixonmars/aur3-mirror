# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lv2-avw
pkgver=0.1.6
pkgrel=1
pkgdesc="An LV2 porting of the AMS internal modules"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/avwlv2/"
license=('GPL')
depends=('lv2' 'gtkmm')
makedepends=('python2' 'lvtk')
provides=('avw.lv2')
conflicts=('avw.lv2')
source=("https://downloads.sourceforge.net/project/avwlv2/avw.lv2-$pkgver.tar.gz")
md5sums=('537cb76ee366214ce4584cd738d86e95')

build() {
  cd avw.lv2-$pkgver
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd avw.lv2-$pkgver
  python2 waf install --destdir="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
