# Maintainer: Michael Egger <gcarq at yahoo dot com>
pkgname=indicator-multiload
pkgver=0.3
pkgrel=5
pkgdesc="System Load indicator for Unity"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-multiload"
license=('GPL')
depends=('cairo' 'libdbusmenu-gtk3' 'xdg-utils' 'gdk-pixbuf2>=2.0' 
         'libindicator-gtk3' 'pango>=1.0' 'gnome-common')
makedepends=('intltool' 'gcc' 'pkg-config' 'autoconf')
options=('strip')
install=$pkgname.install
source=("https://launchpad.net/$pkgname/stable/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('e2ee71af814e0207350d3870e6645669')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf --install --force
  intltoolize --force
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

