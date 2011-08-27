# Maintainer: Jon Bergli Heier <snakebite@jvnv.net>

pkgname=cluttermm
pkgver=1.3.3
pkgrel=1
pkgdesc="C++ bindings for Clutter"
arch=(i686 x86_64)
url="http://wiki.clutter-project.org/wiki/Cluttermm"
license=('LGPL')
depends=('atkmm' 'clutter' 'glibmm' 'pangomm' 'cairomm')
makedepends=('graphviz' 'mm-common')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/cluttermm/1.3/$pkgname-$pkgver.tar.bz2)
md5sums=('34ce0e7ab80ffd71a23193efe236928d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
