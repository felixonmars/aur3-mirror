# Maintainer: archtux <antonio.arias99999@gmail.com>

# This is the last version as standalone application(tray icon).
# Now (>=v0.3.0) it's a KDE Plasma applet.

pkgname=synaptiks-tray-icon
pkgver=0.2.1
pkgrel=2
pkgdesc="Synaptiks is a touchpad tool for KDE. This is the last version with tray icon(not Plasma applet)."
arch=('i686' 'x86_64')
url="http://synaptiks.lunaryorn.de/"
license=('BSD')
depends=('kdebase-lib>=4.3' 'xf86-input-synaptics')
makedepends=('automoc4' 'cmake')
source=(http://bitbucket.org/lunar/synaptiks/downloads/synaptiks-$pkgver.tar.bz2)
md5sums=('f2f5bb3c22fede50736a3aa04bc34b90')

build() {
  cd $srcdir/synaptiks-0.2.1

# BSD License
  install -Dm644 COPYING $pkgdir/usr/share/licenses/synaptiks/COPYING

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) ..
  make
  make DESTDIR=$pkgdir install
}
