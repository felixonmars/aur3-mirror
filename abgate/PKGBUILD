# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=abgate
pkgver=1.1.6
pkgrel=2
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
md5sums=('1c8aea03d44ef023cef3451a9fb16c91')

build() {
  cd "$srcdir/abGate-$pkgver"

  # use qt4
  sed -i "s/qmake/&-qt4/" Makefile

  make
}

package() {
  cd "$srcdir/abGate-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
