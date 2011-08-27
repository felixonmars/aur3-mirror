# Maintainer : SpepS <dreamspepser at yahoo dot it>

pkgname=thunar-vfs
pkgver=1.2.0
pkgrel=1
pkgdesc="Virtual filesystem shipped with the thunar 1.0 and earlier releases."
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('exo' 'startup-notification' 'hal' 'fam' 'gconf' 'libsm')
makedepends=('intltool')
options=('!libtool')
source=("http://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2")
md5sums=('1fbc55af8ed98174f5c3c7f8daec10cc')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --enable-startup-notification \
              --enable-dbus \
              --with-volume-manager=hal \
              --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
