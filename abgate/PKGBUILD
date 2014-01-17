# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=abgate
pkgver=1.1.7
pkgrel=1
pkgdesc="LV2 Noise Gate plugin"
arch=(i686 x86_64)
url="http://abgate.sourceforge.net/"
license=('LGPL3')
groups=('lv2-plugins')
depends=('lv2' 'gtkmm')
makedepends=('qt4')
optdepends=('qt4: Qt 4.x UI')
provides=('lv2-abgate=$pkgver')
conflicts=('lv2-abgate')
replaces=('lv2-abgate')
source=("http://downloads.sourceforge.net/project/$pkgname/abGate-source/abGate-$pkgver.tar.gz")
md5sums=('50bb59c86a6898f162ab8b1894ddf2b7')

build() {
  cd abGate-$pkgver
  make
}

package() {
  cd abGate-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
