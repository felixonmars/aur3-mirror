# Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: Adam Hani Schakaki <krzd@krzd.net>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=gnome-scan
pkgver=0.7.2
pkgrel=5
pkgdesc="Scanning infrastructure and utilities"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/gnome-scan/"
license=('GPL')
depends=('sane' 'gegl-legacy>=0.1.0' 'gconf' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('gimp>=2.2' 'intltool>=0.35.0')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2
        gegl-0.1.0.patch)
md5sums=('44e5341f40a75ebe5cbb8d85becb8f2c'
         'cc7acb5308e0c6e07578206524b760aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/gegl-0.1.0.patch"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static \
              CFLAGS="$CFLAGS `pkg-config --libs gthread-2.0`"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
