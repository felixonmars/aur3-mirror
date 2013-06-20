# Maintainer: Pafrape <pafrape@free.fr>

pkgname=plasma-applet-paneltoggle
pkgver=0.2
pkgrel=1
pkgdesc="Kde plasma applet to toggle visibility of a panel"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Panel+Toggle?content=149654"
license=('LGPL')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake')
source=(http://kde-apps.org/CONTENT/content-files/149654-"$pkgname-$pkgver".tar.bz2)
md5sums=('7062a404e5cdc0078f3d8399a33bf20f')
install=plasma-applet-paneltoggle.install
_tarball="plasma-applet-paneltoggle-$pkgver"

build() {
  cd "$srcdir/$_tarball"
  cmake . -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
  make
}

package() {
  cd "$srcdir/$_tarball"
  make DESTDIR="$pkgdir" install
}