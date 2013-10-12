# Maintainer: Piotr Gorski <sir_lucjan@bridgelinux.pl>

pkgname=libxfce4ui-4.11
_pkgname=libxfce4ui
pkgver=4.11.0
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('libxfce4util' 'gtk2' 'xfconf' 'libsm' 'startup-notification'
         'hicolor-icon-theme')
makedepends=('intltool' 'gtk-doc')
#replaces=('libxfcegui4') - later when all is ported
options=('!libtool')
install=$_pkgname.install
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=(http://archive.xfce.org/src/xfce/$_pkgname/4.11/$_pkgname-$pkgver.tar.bz2)
sha256sums=('2254dc7d95bbb13fba65398269b3c4cfa42232c0de660459bf42b0cd673cd25f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug \
    --with-vendor-info='Arch Linux'
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
