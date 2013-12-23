# Maintainer: Piotr Gorski <sir_lucjan@bridgelinux.pl>

pkgname=xfdesktop-4.11
_pkgname=xfdesktop
pkgver=4.11.2
pkgrel=1
pkgdesc="A desktop manager for Xfce"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui-4.11' 'thunar' 'garcon' 'hicolor-icon-theme' 'libwnck')
makedepends=('intltool')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!libtool')
install=xfdesktop.install
source=(http://archive.xfce.org/src/xfce/$_pkgname/4.11/$_pkgname-$pkgver.tar.bz2)
sha256sums=('d3eacf6a3a37de93f4cdb9f3239d82b49824ab7c9b05c9c86a04e47be4360285')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-thunarx \
    --disable-notifications \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
