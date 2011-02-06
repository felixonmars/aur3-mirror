# Maintainer: Live Evil <9go@tut.by>

pkgname=plasma-message-indicator
pkgver=0.5.6
pkgrel=1
pkgdesc="A Plasma widget which displays messages from message-indicator enabled applications."
arch=('i686' 'x86_64')
url="https://launchpad.net/plasma-widget-message-indicator"
license=('GPL v3')
depends=('kdebase-workspace>=4.4.4' 'libdbusmenu-qt' 'libindicate' 'libindicate-qt')
makedepends=('gcc' 'cmake' 'automoc4')
source=("http://launchpad.net/plasma-widget-message-indicator/trunk/${pkgver}/+download/plasma-widget-message-indicator-${pkgver}.tar.bz2")
md5sums=('5115ee35a69ce08030b3651b3058d30b ')

build() {
  cd $srcdir/plasma-widget-message-indicator-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make DESTDIR=$pkgdir install
}