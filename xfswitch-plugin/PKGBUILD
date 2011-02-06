# Maintainer: Loic Pefferkorn <${firstname} AT loicp DOT eu>
pkgname=xfswitch-plugin
pkgver=0.0.1
pkgrel=4
pkgdesc="User switching plugin for the Xfce4 Panel"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfswitch-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'gdm')
makedepends=('pkg-config' 'intltool')
source=(http://archive.xfce.org/src/panel-plugins/${pkgname}/0.0/$pkgname-$pkgver.tar.gz)
md5sums=('cb204f4a507f462d019529af6f547731')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
